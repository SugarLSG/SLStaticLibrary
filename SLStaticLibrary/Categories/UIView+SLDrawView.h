//
//  UIView+SLDrawView.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SLDrawViewBorderType) {
    SLDrawViewBorderTypeTop,
    SLDrawViewBorderTypeBottom,
    SLDrawViewBorderTypeLeft,
    SLDrawViewBorderTypeRight
};


@interface UIView (SLDrawView)

/**
 绘制边框线
 @param borderType 边框类型（位置）
 @param borderColor 颜色
 @param borderWidth 宽度
 **/
- (void)drawBorder:(SLDrawViewBorderType)borderType borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end
