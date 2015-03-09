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
        [self makeInteractiveOperationEnabled];
        [self addGestureRecognizer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self makeInteractiveOperationEnabled];
        [self addGestureRecognizer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self makeInteractiveOperationEnabled];
        [self addGestureRecognizer];
    }
    return self;
}

/**
 设置允许交互操作
 **/
- (void)makeInteractiveOperationEnabled {
    self.userInteractionEnabled = YES;
    self.multipleTouchEnabled = YES;
}

/**
 添加交互手势
 **/
- (void)addGestureRecognizer {
    // 单击
    UITapGestureRecognizer *singleTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapView:)];
    singleTapGR.numberOfTapsRequired = 1;
    [self addGestureRecognizer:singleTapGR];
}


#pragma 交互

- (void)singleTapView:(UITapGestureRecognizer *)singleTapView {
    if (singleTapView.state == UIGestureRecognizerStateEnded) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(labelDidClick:)]) {
            [self.delegate labelDidClick:self];
        }
    }
}

@end
