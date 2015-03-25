//
//  SLLabel.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>

@class SLLabel;


typedef NS_ENUM(NSInteger, SLLabelInteractiveType) {
    SLLabelInteractiveTypeNone = 0,
    SLLabelInteractiveTypeClick = 1 << 0
};


@protocol SLLabelDelegate <NSObject>

@optional

/**
 单击 Label 后
 **/
- (void)labelDidClick:(SLLabel *)label;

@end


@interface SLLabel : UILabel

@property (nonatomic, strong) id parameter;
@property (nonatomic, assign) SLLabelInteractiveType labelInteractiveType;
@property (nonatomic, weak) id<SLLabelDelegate> delegate;

@end
