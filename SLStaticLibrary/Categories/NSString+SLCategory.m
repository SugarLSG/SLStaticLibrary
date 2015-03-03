//
//  NSString+SLCategory.m
//  SLStaticLibrary
//

#import "NSString+SLCategory.h"


@implementation NSString (SLCategory)

+ (BOOL)isNullOrEmpty:(NSString *)value {
    // 判断是否为 nil 或长度为0
    return !value || [value length] == 0;
}

+ (BOOL)isNullOrWhiteSpace:(NSString *)value {
    // 判断是否为 nil
    if (!value) {
        return YES;
    }
    
    // 替换掉所有空格后，判断长度是否为0
    return [[value stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0;
}

- (instancetype)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
