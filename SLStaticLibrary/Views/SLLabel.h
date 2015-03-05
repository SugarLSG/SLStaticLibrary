//
//  SLLabel.h
//  SLStaticLibrary
//


#import <UIKit/UIKit.h>

@class SLLabel;


@protocol SLLabelDelegate <NSObject>

@optional

/**
 点击 Label 时
 **/
- (void)labelBeginTouch:(SLLabel *)label;
/**
 点击 Label 后
 **/
- (void)labelDidTouched:(SLLabel *)label;

@end


@interface SLLabel : UILabel

@property (nonatomic, strong) id parameter;
@property (nonatomic, weak) id<SLLabelDelegate> delegate;

@end
