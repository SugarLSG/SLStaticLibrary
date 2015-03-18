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
    // 设置线条样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    // 设置颜色
    NSDictionary *colorValues = [borderColor getRGBADictionary];
    CGContextSetRGBStrokeColor(context, [colorValues[UIColorRedValueName] floatValue], [colorValues[UIColorGreenValueName] floatValue], [colorValues[UIColorBlueValueName] floatValue], [colorValues[UIColorAlphaValueName] floatValue]);
    // 设置线条粗细宽度
    CGContextSetLineWidth(context, borderWidth);
    
    // 开始一个起始路径
    CGContextBeginPath(context);
    // 设置起始、结束坐标
    switch (borderType) {
        case SLDrawViewBorderTypeTop: {
            CGContextMoveToPoint(context, 0, 0);
            CGContextAddLineToPoint(context, self.frame.size.width, 0);
            break;
        }
        case SLDrawViewBorderTypeBottom: {
            CGContextMoveToPoint(context, 0, self.frame.origin.y);
            CGContextAddLineToPoint(context, self.frame.size.width, self.frame.origin.y);
            break;
        }
        case SLDrawViewBorderTypeLeft: {
            CGContextMoveToPoint(context, 0, 0);
            CGContextAddLineToPoint(context, 0, self.frame.origin.y);
            break;
        }
        case SLDrawViewBorderTypeRight: {
            CGContextMoveToPoint(context, self.frame.size.width, 0);
            CGContextAddLineToPoint(context, self.frame.size.width, self.frame.origin.y);
            break;
        }
    }
    // 连接上面定义的坐标点
    CGContextStrokePath(context);
}

@end
