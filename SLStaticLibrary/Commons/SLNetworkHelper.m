//
//  SLNetworkHelper.m
//  SLStaticLibrary
//

#import "SLNetworkHelper.h"
#import "SLStaticLibrary.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"


@implementation SLNetworkHelper

#pragma mark - Private Methods

+ (AFHTTPRequestOperationManager *)getHTTPRequestOperationManager {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return manager;
}


#pragma mark - Public Methods

+ (void)monitorNetworkWithChangeBlock:(void (^)(AFNetworkReachabilityStatus))changeBlock {
    // 启动监控网络状态的变化
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 网络变化时回调
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:changeBlock];
}

+ (void)getRequestWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id))successBlock failure:(void (^)())failureBlock {
    // 获取 manager
    AFHTTPRequestOperationManager *manager = [self getHTTPRequestOperationManager];
    // get 请求
    [manager GET:url
            parameters:parameters
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                // 请求成功
                DebugLog(@"REQUEST SUCCESS, URL: %@", operation.request.URL);
                if (successBlock) {
//                    successBlock(responseObject);
                    NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    successBlock(responseData);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                // 请求失败
                DebugLog(@"REQUEST FAILURE, ERROR: %@", error);
                if (failureBlock) {
                    failureBlock();
                }
            }
     ];
}

+ (void)postRequestWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id))successBlock failure:(void (^)())failureBlock {
    // 获取 manager
    AFHTTPRequestOperationManager *manager = [self getHTTPRequestOperationManager];
    // post 请求
    [manager POST:url
            parameters:parameters
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                // 请求成功
                DebugLog(@"REQUEST SUCCESS, URL: %@", operation.request.URL);
                if (successBlock) {
//                    successBlock(responseObject);
                    NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    successBlock(responseData);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                // 请求失败
                DebugLog(@"REQUEST FAILURE, ERROR: %@", error);
                if (failureBlock) {
                    failureBlock();
                }
            }
     ];
}


+ (NSUInteger)getImageCacheSize {
    return [[SDImageCache sharedImageCache] getSize];
}

+ (NSUInteger)getImageCacheCount {
    return [[SDImageCache sharedImageCache] getDiskCount];
}

+ (void)clearImageCache {
    [[SDImageCache sharedImageCache] clearMemory];  // 内存缓存
    [[SDImageCache sharedImageCache] clearDisk];      // 本地缓存
}

+ (void)loadImageViewWithImageView:(UIImageView *)imgView placeholderImage:(UIImage *)placeholderImage url:(NSString *)url success:(void (^)())successBlock failure:(void (^)())failureBlock {
    // 加载
    [imgView sd_setImageWithURL:[NSURL URLWithString:url]
                        placeholderImage:placeholderImage
                        options:SDWebImageProgressiveDownload
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                            if (image) {
                                // 请求成功
                                DebugLog(@"REQUEST SUCCESS, FROME %@, URL: %@", (cacheType == SDImageCacheTypeNone ? @"Internet": (cacheType == SDImageCacheTypeDisk ? @"Disk": @"Memory")), imageURL);
                                if (successBlock) {
                                    successBlock();
                                }
                            } else if (error) {
                                // 请求失败
                                DebugLog(@"REQUEST FAILURE, ERROR: %@", error);
                                imgView.image = placeholderImage;
                                if (failureBlock) {
                                    failureBlock();
                                }
                            }
                        }
     ];
}

+ (void)getImageWithUrl:(NSString *)url success:(void (^)(UIImage *))successBlock failure:(void (^)())failureBlock {
    // 获取 manager
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    // 请求
    [manager downloadImageWithURL:[NSURL URLWithString:url]
                            options:SDWebImageRetryFailed
                            progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                if (finished) {
                                    // 完成获取
                                    if (image) {
                                        // 请求成功
                                        DebugLog(@"REQUEST SUCCESS, FROME %@, URL: %@", (cacheType == SDImageCacheTypeNone ? @"Internet": (cacheType == SDImageCacheTypeDisk ? @"Disk": @"Memory")), imageURL);
                                        if (successBlock) {
                                            successBlock(image);
                                        }
                                    } else if (error) {
                                        // 请求失败
                                        DebugLog(@"REQUEST FAILURE, ERROR: %@", error);
                                        if (failureBlock) {
                                            failureBlock();
                                        }
                                    }
                                }
                            }
     ];
}

@end
