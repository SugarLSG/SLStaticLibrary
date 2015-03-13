//
//  NSString+SLCategory.h
//  SLStaticLibrary
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (SLCategory)

/**
 判断是否为 nil 或空字符串
 **/
+ (BOOL)isNullOrEmpty:(NSString *)value;

/**
 判断是否为 nil 或全为空格字符
 **/
+ (BOOL)isNullOrWhiteSpace:(NSString *)value;


/**
 删除前后所有空格字符
 **/
- (instancetype)trim;

/**
 根据字体，宽度，计算文字总高度
 **/
- (CGFloat)heightForFont:(UIFont *)font width:(float)width;

@end
