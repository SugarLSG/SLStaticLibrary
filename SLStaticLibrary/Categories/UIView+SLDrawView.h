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

- (void)drawBorder:(SLDrawViewBorderType)borderType borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end
