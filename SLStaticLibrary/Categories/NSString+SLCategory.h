//
//  NSString+SLCategory.h
//  SLStaticLibrary
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (SLCategory)

/**
 判断是否为 nil 或空字符串
 @param value 字符串变量
 **/
+ (BOOL)isNullOrEmpty:(NSString *)value;

/**
 判断是否为 nil 或全为空格字符
 @param value 字符串变量
 **/
+ (BOOL)isNullOrWhiteSpace:(NSString *)value;


/**
 删除前后所有空格字符
 @return 新字符串
 **/
- (instancetype)trim;

/**
 根据字体，宽度，计算文字总高度
 @param font 使用的字体
 @param width 区域宽度
 @return 高度
 **/
- (CGFloat)heightForFont:(UIFont *)font width:(float)width;


/**
 将字符串中中文字符转为拼音首字母
 @return 拼音首字符串
 **/
- (NSString *)ConvertPinYinFirstLetters;

@end
