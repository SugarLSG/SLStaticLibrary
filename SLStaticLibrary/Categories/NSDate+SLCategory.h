//
//  NSDate+SLCategory.h
//  SLStaticLibrary
//
//  Created by mc.sugar on 15/4/3.
//
//

#import <Foundation/Foundation.h>


@interface NSDate (SLCategory)

/**
 将时间字符串转为时间格式
 @param valueString 时间字符串
 @param formatString 时间字符串格式
 @return 时间
 **/
+ (NSDate *)convertDate:(NSString *)valueString formatString:(NSString *)formatString;


/**
 将时间转为字符串格式
 @param formatString 时间字符串格式
 @return 时间字符串
 **/
- (NSString *)toString:(NSString *)formatString;

@end
