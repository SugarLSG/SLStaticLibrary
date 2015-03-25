//
//  SLLabel.m
//  SLStaticLibrary
//

#import "SLLabel.h"


@implementation SLLabel

- (instancetype)init {
    if (self = [super init]) {
        self.labelInteractiveType = SLLabelInteractiveTypeClick;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.labelInteractiveType = SLLabelInteractiveTypeClick;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.labelInteractiveType = SLLabelInteractiveTypeClick;
    }
    return self;
}


#pragma mark - 交互

/**
 设置交互手势
 **/
- (void)setLabelInteractiveType:(SLLabelInteractiveType)labelInteractiveType {
    for (UIGestureRecognizer *gr in self.gestureRecognizers) {
        [self removeGestureRecognizer:gr];
    }
    
    // 设置允许交互操作
    self.userInteractionEnabled = YES;
    self.multipleTouchEnabled = YES;
    
    self->_labelInteractiveType = labelInteractiveType;
    if (self.labelInteractiveType == SLLabelInteractiveTypeClick) {
        [self setSingleTapGestureRecognizer];
    }
}

/**
 单击
 **/
- (void)setSingleTapGestureRecognizer {
    UITapGestureRecognizer *singleTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapView:)];
    singleTapGR.numberOfTapsRequired = 1;
    [self addGestureRecognizer:singleTapGR];
}


- (void)singleTapView:(UITapGestureRecognizer *)singleTapView {
    if (singleTapView.state == UIGestureRecognizerStateEnded) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(labelDidClick:)]) {
            [self.delegate labelDidClick:self];
        }
    }
}

@end
