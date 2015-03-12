//
//  UIColor+SLCategory.m
//  SLStaticLibrary
//

#import "UIColor+SLCategory.h"


@implementation UIColor (SLCategory)

+ (UIColor *)colorWithHexValue:(NSString *)hexValue alpha:(CGFloat)alpha {
    hexValue = [hexValue stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    if (hexValue.length != 3 && hexValue.length != 6) {
        return nil;
    }
    
    if(hexValue.length == 3) {
        hexValue = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                    [hexValue substringWithRange:NSMakeRange(0, 1)], [hexValue substringWithRange:NSMakeRange(0, 1)],
                    [hexValue substringWithRange:NSMakeRange(1, 1)], [hexValue substringWithRange:NSMakeRange(1, 1)],
                    [hexValue substringWithRange:NSMakeRange(2, 1)], [hexValue substringWithRange:NSMakeRange(2, 1)]
                    ];
    }
    
    uint baseValue;
    [[NSScanner scannerWithString:hexValue] scanHexInt:&baseValue];
    
    CGFloat red = ((baseValue >> 16) & 0xFF) / 255.f;
    CGFloat green = ((baseValue >> 8) & 0xFF) / 255.f;
    CGFloat blue = ((baseValue >> 0) & 0xFF) / 255.f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
