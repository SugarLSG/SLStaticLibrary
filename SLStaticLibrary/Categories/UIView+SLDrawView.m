//
//  UIView+SLDrawView.m
//  SLStaticLibrary
//

#import "UIView+SLDrawView.h"
#import "UIColor+SLCategory.h"


@implementation UIView (SLDrawView)

- (void)drawBorder:(SLDrawViewBorderType)borderType borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    // 获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置颜色
    NSDictionary *colorValues = [borderColor getRGBADictionary];
    CGContextSetRGBStrokeColor(context, [colorValues[UIColorRedValueName] floatValue], [colorValues[UIColorGreenValueName] floatValue], [colorValues[UIColorBlueValueName] floatValue], [colorValues[UIColorAlphaValueName] floatValue]);
    // 设置线条粗细宽度
    CGContextSetLineWidth(context, borderWidth);
    
    // 开始一个起始路径
    CGContextBeginPath(context);
    // 设置起始、结束坐标
    CGPoint points[2];
    switch (borderType) {
        case SLDrawViewBorderTypeTop: {
            points[0] = CGPointMake(0, 0);
            points[1] = CGPointMake(self.frame.size.width, 0);
            break;
        }
        case SLDrawViewBorderTypeBottom: {
            points[0] = CGPointMake(0, self.frame.origin.y);
            points[1] = CGPointMake(self.frame.size.width, self.frame.size.height);
            break;
        }
        case SLDrawViewBorderTypeLeft: {
            points[0] = CGPointMake(0, 0);
            points[1] = CGPointMake(0, self.frame.size.height);
            break;
        }
        case SLDrawViewBorderTypeRight: {
            points[0] = CGPointMake(self.frame.size.width, 0);
            points[1] = CGPointMake(self.frame.size.width, self.frame.size.height);
            break;
        }
    }
    // 添加坐标点
    CGContextAddLines(context, points, 2);
    // 根据坐标绘制路径
    CGContextDrawPath(context, kCGPathStroke);
}

@end
