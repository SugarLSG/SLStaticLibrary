//
//  UIImage+SLCategory.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>


@interface UIImage (SLCategory)

/**
 根据颜色、大小，生成单色 Image
 **/
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
