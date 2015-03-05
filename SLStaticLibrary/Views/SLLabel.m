//
//  SLLabel.m
//  SLStaticLibrary
//

#import "SLLabel.h"


@interface SLLabel ()

@property (nonatomic, assign) BOOL isMoving;

@end


@implementation SLLabel

- (instancetype)init {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}


#pragma NSObject

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(labelBeginTouch:)]) {
        [self.delegate labelBeginTouch:self];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 标示为移动中
    self.isMoving = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 判断是拖曳还是快速点击
    if (!self.isMoving) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(labelDidTouched:)]) {
            [self.delegate labelDidTouched:self];
        }
    }
    
    // 重置是否移动中
    self.isMoving = NO;
}

@end
