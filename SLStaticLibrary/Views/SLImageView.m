//
//  SLImageView.m
//  SLStaticLibrary
//

#import "SLImageView.h"


@interface SLImageView ()

@property (nonatomic, assign) BOOL isMoving;

@end


@implementation SLImageView

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

- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super initWithImage:image]) {
        [self makeInteractiveOperationEnabled];
        [self addGestureRecognizer];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    if (self = [super initWithImage:image highlightedImage:highlightedImage]) {
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
    
    // 双击
    UITapGestureRecognizer *doubleTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapView:)];
    doubleTapGR.numberOfTapsRequired = 2;
    [singleTapGR requireGestureRecognizerToFail:doubleTapGR];
    [self addGestureRecognizer:doubleTapGR];
    
    // 缩放
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [self addGestureRecognizer:pinchGR];
    
    // 移动
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [self addGestureRecognizer:panGR];
}


#pragma 交互

- (void)singleTapView:(UITapGestureRecognizer *)singleTapView {
    if (singleTapView.state == UIGestureRecognizerStateEnded) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewDidClick:)]) {
            [self.delegate imageViewDidClick:self];
        }
    }
}

- (void)doubleTapView:(UITapGestureRecognizer *)doubleTapGR {
    if (doubleTapGR.state == UIGestureRecognizerStateEnded) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewDidDoubleClick:)]) {
            [self.delegate imageViewDidDoubleClick:self];
        }
    }
}

- (void)pinchView:(UIPinchGestureRecognizer *)pinchGR {
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewDidZoomed:state:scale:)]) {
        [self.delegate imageViewDidZoomed:self state:pinchGR.state scale:pinchGR.scale];
    }
}

- (void)panView:(UIPanGestureRecognizer *)panGR {
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewDidMove:state:translation:)]) {
        [self.delegate imageViewDidMove:self state:panGR.state translation:[panGR translationInView:self]];
    }
}

@end
