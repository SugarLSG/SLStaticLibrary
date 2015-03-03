//
//  NSString+SLCategory.h
//  SLStaticLibrary
//

#import <Foundation/Foundation.h>


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

@end
