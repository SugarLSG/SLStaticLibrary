//
//  UIView+SLDrawView.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SLDrawViewBorderDirection) {
    SLDrawViewBorderDirectionTop = 1 << 0,
    SLDrawViewBorderDirectionBottom = 1 << 1,
    SLDrawViewBorderDirectionLeft = 1 << 2,
    SLDrawViewBorderDirectionRight = 1 << 3
};


@interface UIView (SLDrawView)

/**
 绘制边框线
 @param borderDirection 边框位置
 @param borderColor 颜色
 @param borderWidth 宽度
 **/
- (void)drawBorder:(SLDrawViewBorderDirection)borderDirection borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end
