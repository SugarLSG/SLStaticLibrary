//
//  UIColor+SLCategory.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>


@interface UIColor (SLCategory)

/**
 根据十六进制颜色值（如：#000000、000000），生成对应颜色
 **/
+ (UIColor *)colorWithHexValue:(NSString *)hexValue alpha:(CGFloat)alpha;

@end
