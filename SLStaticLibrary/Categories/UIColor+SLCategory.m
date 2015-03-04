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
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:hexValue] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 16) & 0xFF) / 255.0f;
    float green = ((baseValue >> 8) & 0xFF) / 255.0f;
    float blue = ((baseValue >> 0) & 0xFF) / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
