//
//  SLNetworkHelper.h
//  SLStaticLibrary
//

#import "AFHTTPRequestOperationManager.h"


@interface SLNetworkHelper : NSObject

/**
 监控网络
 **/
+ (void)monitorNetworkWithChangeBlock:(void (^)(AFNetworkReachabilityStatus status))changeBlock;

/**
 Get 请求
 **/
+ (void)getRequestWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id responseData))successBlock failure:(void (^)())failureBlock;

/**
 Post 请求
 **/
+ (void)postRequestWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id responseData))successBlock failure:(void (^)())failureBlock;


/**
 获取图片缓存大小（bytes）
 **/
+ (NSUInteger)getImageCacheSize;

/**
 获取图片缓存数量
 **/
+ (NSUInteger)getImageCacheCount;

/**
 清除图片缓存
 **/
+ (void)clearImageCache;

/**
 加载图片
 **/
+ (void)loadImageViewWithImageView:(UIImageView *)imgView placeholderImage:(UIImage *)placeholderImage url:(NSString *)url success:(void (^)())successBlock failure:(void (^)())failureBlock;

/**
 请求图片
 **/
+ (void)getImageWithUrl:(NSString *)url success:(void (^)(UIImage *image))successBlock failure:(void (^)())failureBlock;

@end
