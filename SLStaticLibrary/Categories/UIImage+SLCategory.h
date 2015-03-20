//
//  UIImage+SLCategory.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>


@interface UIImage (SLCategory)

/**
 根据颜色、大小，生成单色 Image
 @param color 颜色
 @param size 大小
 @return 图片
 **/
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
