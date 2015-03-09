//
//  SLNetworkHelper.h
//  SLStaticLibrary
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SLNetworkHelper : NSObject

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
