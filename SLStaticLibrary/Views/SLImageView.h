//
//  SLImageView.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>

@class SLImageView;


@protocol SLImageViewDelegate <NSObject>

@optional

/**
 单击图片后
 **/
- (void)imageViewDidClick:(SLImageView *)imageView;
/**
 双击图片后
 **/
- (void)imageViewDidDoubleClick:(SLImageView *)imageView;
/**
 缩放图片后
 **/
- (void)imageViewDidZoomed:(SLImageView *)imageView state:(UIGestureRecognizerState)state scale:(CGFloat)scale;
/**
 移动图片后
 **/
- (void)imageViewDidMove:(SLImageView *)imageView state:(UIGestureRecognizerState)state translation:(CGPoint)translation;

@end


@interface SLImageView : UIImageView

@property (nonatomic, strong) id parameter;
@property (nonatomic, weak) id<SLImageViewDelegate> delegate;

@end
