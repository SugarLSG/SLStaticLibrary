//
//  UIView+SLDrawView.m
//  SLStaticLibrary
//

#import "UIView+SLDrawView.h"
#import "UIColor+SLCategory.h"


@implementation UIView (SLDrawView)

/**
 获取边框起始、终止坐标
 **/
- (void)getBorderPoints:(SLDrawViewBorderDirection)borderDirection withPoints:(CGPoint *)points {
    // 起始、终止坐标
    switch (borderDirection) {
        case SLDrawViewBorderDirectionTop: {
            points[0] = CGPointMake(0, 0);
            points[1] = CGPointMake(self.frame.size.width, 0);
            break;
        }
            
        case SLDrawViewBorderDirectionBottom: {
            points[0] = CGPointMake(0, self.frame.size.height);
            points[1] = CGPointMake(self.frame.size.width, self.frame.size.height);
            break;
        }
            
        case SLDrawViewBorderDirectionLeft: {
            points[0] = CGPointMake(0, 0);
            points[1] = CGPointMake(0, self.frame.size.height);
            break;
        }
            
        case SLDrawViewBorderDirectionRight: {
            points[0] = CGPointMake(self.frame.size.width, 0);
            points[1] = CGPointMake(self.frame.size.width, self.frame.size.height);
            break;
        }
    }
}

- (void)drawBorder:(SLDrawViewBorderDirection)borderDirection borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    // 获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置颜色
    NSDictionary *colorValues = [borderColor getRGBADictionary];
    CGContextSetRGBStrokeColor(context, [colorValues[UIColorRedValueName] floatValue], [colorValues[UIColorGreenValueName] floatValue], [colorValues[UIColorBlueValueName] floatValue], [colorValues[UIColorAlphaValueName] floatValue]);
    // 设置线条粗细宽度
    CGContextSetLineWidth(context, borderWidth);
    
    // 开始一个起始路径
    CGContextBeginPath(context);
    // 设置起始、终止坐标
    if (borderDirection == SLDrawViewBorderDirectionTop) {
        CGPoint points[2];
        [self getBorderPoints:SLDrawViewBorderDirectionTop withPoints:points];
        CGContextAddLines(context, points, 2);
    } else if (borderDirection == SLDrawViewBorderDirectionBottom) {
        CGPoint points[2];
        [self getBorderPoints:SLDrawViewBorderDirectionBottom withPoints:points];
        CGContextAddLines(context, points, 2);
    } else if (borderDirection == SLDrawViewBorderDirectionLeft) {
        CGPoint points[2];
        [self getBorderPoints:SLDrawViewBorderDirectionLeft withPoints:points];
        CGContextAddLines(context, points, 2);
    } else if (borderDirection == SLDrawViewBorderDirectionRight) {
        CGPoint points[2];
        [self getBorderPoints:SLDrawViewBorderDirectionRight withPoints:points];
        CGContextAddLines(context, points, 2);
    }
    else if (borderDirection == (SLDrawViewBorderDirectionTop | SLDrawViewBorderDirectionBottom)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionTop withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionBottom withPoints:points2];
        CGContextAddLines(context, points2, 2);
    } else if (borderDirection == (SLDrawViewBorderDirectionTop | SLDrawViewBorderDirectionLeft)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionTop withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionLeft withPoints:points2];
        CGContextAddLines(context, points2, 2);
    } else if (borderDirection == (SLDrawViewBorderDirectionTop | SLDrawViewBorderDirectionRight)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionTop withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionRight withPoints:points2];
        CGContextAddLines(context, points2, 2);
    } else if (borderDirection == (SLDrawViewBorderDirectionBottom | SLDrawViewBorderDirectionLeft)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionBottom withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionLeft withPoints:points2];
        CGContextAddLines(context, points2, 2);
    } else if (borderDirection == (SLDrawViewBorderDirectionBottom | SLDrawViewBorderDirectionRight)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionBottom withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionRight withPoints:points2];
        CGContextAddLines(context, points2, 2);
    } else if (borderDirection == (SLDrawViewBorderDirectionLeft | SLDrawViewBorderDirectionRight)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionLeft withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionRight withPoints:points2];
        CGContextAddLines(context, points2, 2);
    }
    else if (borderDirection == (SLDrawViewBorderDirectionTop | SLDrawViewBorderDirectionBottom | SLDrawViewBorderDirectionLeft)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionTop withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionBottom withPoints:points2];
        CGContextAddLines(context, points2, 2);
        CGPoint points3[2];
        [self getBorderPoints:SLDrawViewBorderDirectionLeft withPoints:points3];
        CGContextAddLines(context, points3, 2);
    } else if (borderDirection == (SLDrawViewBorderDirectionTop | SLDrawViewBorderDirectionBottom | SLDrawViewBorderDirectionRight)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionTop withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionBottom withPoints:points2];
        CGContextAddLines(context, points2, 2);
        CGPoint points3[2];
        [self getBorderPoints:SLDrawViewBorderDirectionRight withPoints:points3];
        CGContextAddLines(context, points3, 2);
    } else if (borderDirection == (SLDrawViewBorderDirectionTop | SLDrawViewBorderDirectionLeft | SLDrawViewBorderDirectionRight)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionTop withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionLeft withPoints:points2];
        CGContextAddLines(context, points2, 2);
        CGPoint points3[2];
        [self getBorderPoints:SLDrawViewBorderDirectionRight withPoints:points3];
        CGContextAddLines(context, points3, 2);
    } else if (borderDirection == (SLDrawViewBorderDirectionBottom | SLDrawViewBorderDirectionLeft | SLDrawViewBorderDirectionRight)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionBottom withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionLeft withPoints:points2];
        CGContextAddLines(context, points2, 2);
        CGPoint points3[2];
        [self getBorderPoints:SLDrawViewBorderDirectionRight withPoints:points3];
        CGContextAddLines(context, points3, 2);
    }
    else if (borderDirection == (SLDrawViewBorderDirectionTop | SLDrawViewBorderDirectionBottom | SLDrawViewBorderDirectionLeft | SLDrawViewBorderDirectionRight)) {
        CGPoint points1[2];
        [self getBorderPoints:SLDrawViewBorderDirectionTop withPoints:points1];
        CGContextAddLines(context, points1, 2);
        CGPoint points2[2];
        [self getBorderPoints:SLDrawViewBorderDirectionBottom withPoints:points2];
        CGContextAddLines(context, points2, 2);
        CGPoint points3[2];
        [self getBorderPoints:SLDrawViewBorderDirectionLeft withPoints:points3];
        CGContextAddLines(context, points3, 2);
        CGPoint points4[2];
        [self getBorderPoints:SLDrawViewBorderDirectionRight withPoints:points4];
        CGContextAddLines(context, points4, 2);
    }
    // 根据坐标绘制路径
    CGContextDrawPath(context, kCGPathStroke);
}

@end
