//
//  SLNetworkHelper.h
//  SLStaticLibrary
//

#import "AFHTTPRequestOperationManager.h"


@interface SLNetworkHelper : NSObject

/**
 监控网络
 @param changeBlock 改变时的回调函数
 **/
+ (void)monitorNetworkWithChangeBlock:(void (^)(AFNetworkReachabilityStatus status))changeBlock;

/**
 Get 请求
 @param url 请求地址
 @param parameters 参数
 @param successBlock 成功时的回调函数
 @param failureBlock 失败时的回调函数
 **/
+ (void)getRequestWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id responseData))successBlock failure:(void (^)())failureBlock;

/**
 Post 请求
 @param url 请求地址
 @param parameters 参数
 @param successBlock 成功时的回调函数
 @param failureBlock 失败时的回调函数
 **/
+ (void)postRequestWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id responseData))successBlock failure:(void (^)())failureBlock;


/**
 获取图片缓存大小（bytes）
 @return 缓存大小
 **/
+ (NSUInteger)getImageCacheSize;

/**
 获取图片缓存数量
 @return 缓存数量
 **/
+ (NSUInteger)getImageCacheCount;

/**
 清除图片缓存
 **/
+ (void)clearImageCache;

/**
 加载图片
 @param imgView 承载图片的 UIImageView
 @param placeholderImage 占位图片
 @param url 图片地址
 @param successBlock 成功时的回调函数
 @param failureBlock 失败时的回调函数
 **/
+ (void)loadImageViewWithImageView:(UIImageView *)imgView placeholderImage:(UIImage *)placeholderImage url:(NSString *)url success:(void (^)())successBlock failure:(void (^)())failureBlock;

/**
 请求图片
 @param url 图片地址
 @param successBlock 成功时的回调函数
 @param failureBlock 失败时的回调函数
 **/
+ (void)getImageWithUrl:(NSString *)url success:(void (^)(UIImage *image))successBlock failure:(void (^)())failureBlock;

@end
