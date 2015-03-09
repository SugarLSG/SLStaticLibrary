//
//  SLLabel.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>

@class SLLabel;


@protocol SLLabelDelegate <NSObject>

@optional

/**
 单击 Label 后
 **/
- (void)labelDidClick:(SLLabel *)label;

@end


@interface SLLabel : UILabel

@property (nonatomic, strong) id parameter;
@property (nonatomic, weak) id<SLLabelDelegate> delegate;

@end
