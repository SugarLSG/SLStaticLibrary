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
                                NSString *catcheTypeStr =
                                    cacheType == SDImageCacheTypeNone ? @"Internet":
                                    (cacheType == SDImageCacheTypeDisk ? @"Disk": @"Memory");
                                DebugLog(@"REQUEST SUCCESS, FROME %@, URL: %@", catcheTypeStr, imageURL);
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
                                        NSString *catcheTypeStr =
                                            cacheType == SDImageCacheTypeNone ? @"Internet":
                                            (cacheType == SDImageCacheTypeDisk ? @"Disk": @"Memory");
                                        DebugLog(@"REQUEST SUCCESS, FROME %@, URL: %@", catcheTypeStr, imageURL);
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
