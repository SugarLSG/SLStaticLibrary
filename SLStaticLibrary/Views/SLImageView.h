//
//  SLImageView.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>

@class SLImageView;


@protocol SLImageViewDelegate <NSObject>

@optional

/**
 点击图片时
 **/
- (void)imageViewBeginTouch:(SLImageView *)imageView;
/**
 点击图片后
 **/
- (void)imageViewDidTouched:(SLImageView *)imageView;

@end


@interface SLImageView : UIImageView

@property (nonatomic, strong) id parameter;
@property (nonatomic, weak) id<SLImageViewDelegate> delegate;

@end
