//
//  NSString+SLCategory.m
//  SLStaticLibrary
//

#import "NSString+SLCategory.h"
#import "pinyin.h"


#define LOWERCASE_START 65
#define LOWERCASE_END 90
#define UPPERCASE_START 97
#define UPPERCASE_END 122


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

- (CGFloat)heightForFont:(UIFont *)font width:(float)width {
    NSDictionary *attributes = @{ NSFontAttributeName: font };
    CGRect sizeToFit = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return sizeToFit.size.height;
}


- (NSString *)convertPinYinFirstLetters {
    if (![NSString isNullOrEmpty:self]) {
        NSString *result = @"";
        for (NSUInteger i = 0, count = self.length; i < count; ++i) {
            unichar c = [self characterAtIndex:i];
            if (!((c >= LOWERCASE_START && c <= LOWERCASE_END) ||
                  (c >= UPPERCASE_START && c <= UPPERCASE_END))) {
                c = pinyinFirstLetter(c);
            }
            
            result = [result stringByAppendingFormat:@"%c", c];
        }
        return [result uppercaseString];
    }
    return self;
}

@end
