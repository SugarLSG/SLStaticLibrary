//
//  UIColor+SLCategory.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>


extern NSString *const UIColorRedValueName;
extern NSString *const UIColorGreenValueName;
extern NSString *const UIColorBlueValueName;
extern NSString *const UIColorAlphaValueName;


@interface UIColor (SLCategory)

/**
 根据十六进制颜色值（如：#000000、000000），生成对应颜色
 **/
+ (UIColor *)colorWithHexValue:(NSString *)hexValue alpha:(CGFloat)alpha;


/**
 获取颜色对应 RGBA 的值
 **/
- (NSDictionary *)getRGBADictionary;

@end
