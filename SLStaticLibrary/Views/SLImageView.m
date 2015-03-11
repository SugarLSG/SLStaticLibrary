//
//  SLImageView.m
//  SLStaticLibrary
//

#import "SLImageView.h"


@implementation SLImageView

- (instancetype)init {
    if (self = [super init]) {
        [self makeInteractiveOperationEnabled];
        self.imageViewInteractiveType = SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeZoom | SLImageViewInteractiveTypeMove;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self makeInteractiveOperationEnabled];
        self.imageViewInteractiveType = SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeZoom | SLImageViewInteractiveTypeMove;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self makeInteractiveOperationEnabled];
        self.imageViewInteractiveType = SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeZoom | SLImageViewInteractiveTypeMove;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super initWithImage:image]) {
        [self makeInteractiveOperationEnabled];
        self.imageViewInteractiveType = SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeZoom | SLImageViewInteractiveTypeMove;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    if (self = [super initWithImage:image highlightedImage:highlightedImage]) {
        [self makeInteractiveOperationEnabled];
        self.imageViewInteractiveType = SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeZoom | SLImageViewInteractiveTypeMove;
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


#pragma mark - 交互

/**
 设置交互手势
 **/
- (void)setImageViewInteractiveType:(SLImageViewInteractiveType)imageViewInteractiveType {
    for (UIGestureRecognizer *gr in self.gestureRecognizers) {
        [self removeGestureRecognizer:gr];
    }
    
    self->_imageViewInteractiveType = imageViewInteractiveType;
    if (imageViewInteractiveType == SLImageViewInteractiveTypeClick) {
        [self setSingleTapGestureRecognizer];
    } else if (imageViewInteractiveType == SLImageViewInteractiveTypeDoubleClick) {
        [self setDoubleTapGestureRecognizer];
    } else if (imageViewInteractiveType == SLImageViewInteractiveTypeZoom) {
        [self setPinchGestureRecognizer];
    } else if (imageViewInteractiveType == SLImageViewInteractiveTypeMove) {
        [self setPanGestureRecognizer];
    }
    else if (imageViewInteractiveType == (SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeDoubleClick)) {
        [self setSingleTapGestureRecognizer];
        [self setDoubleTapGestureRecognizer];
    } else if (imageViewInteractiveType == (SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeZoom)) {
        [self setSingleTapGestureRecognizer];
        [self setPinchGestureRecognizer];
    } else if (imageViewInteractiveType == (SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeMove)) {
        [self setSingleTapGestureRecognizer];
        [self setPanGestureRecognizer];
    } else if (imageViewInteractiveType == (SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeZoom)) {
        [self setDoubleTapGestureRecognizer];
        [self setPinchGestureRecognizer];
    } else if (imageViewInteractiveType == (SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeMove)) {
        [self setDoubleTapGestureRecognizer];
        [self setPanGestureRecognizer];
    } else if (imageViewInteractiveType == (SLImageViewInteractiveTypeZoom | SLImageViewInteractiveTypeMove)) {
        [self setPinchGestureRecognizer];
        [self setPanGestureRecognizer];
    }
    else if (imageViewInteractiveType == (SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeZoom)) {
        [self setSingleTapGestureRecognizer];
        [self setDoubleTapGestureRecognizer];
        [self setPinchGestureRecognizer];
    } else if (imageViewInteractiveType == (SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeMove)) {
        [self setSingleTapGestureRecognizer];
        [self setDoubleTapGestureRecognizer];
        [self setPanGestureRecognizer];
    } else if (imageViewInteractiveType == (SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeZoom | SLImageViewInteractiveTypeMove)) {
        [self setSingleTapGestureRecognizer];
        [self setPinchGestureRecognizer];
        [self setPanGestureRecognizer];
    } else if (imageViewInteractiveType == (SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeZoom | SLImageViewInteractiveTypeMove)) {
        [self setDoubleTapGestureRecognizer];
        [self setPinchGestureRecognizer];
        [self setPanGestureRecognizer];
    }
    else if (imageViewInteractiveType == (SLImageViewInteractiveTypeClick | SLImageViewInteractiveTypeDoubleClick | SLImageViewInteractiveTypeZoom | SLImageViewInteractiveTypeMove)) {
        [self setSingleTapGestureRecognizer];
        [self setDoubleTapGestureRecognizer];
        [self setPinchGestureRecognizer];
        [self setPanGestureRecognizer];
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

/**
 双击
 **/
- (void)setDoubleTapGestureRecognizer {
    UITapGestureRecognizer *doubleTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapView:)];
    doubleTapGR.numberOfTapsRequired = 2;
    for (UIGestureRecognizer *gr in self.gestureRecognizers) {
        if ([gr isKindOfClass:[UITapGestureRecognizer class]]) {
            if (((UITapGestureRecognizer *)gr).numberOfTapsRequired == 1) {
                [gr requireGestureRecognizerToFail:doubleTapGR];
                break;
            }
        }
    }
    [self addGestureRecognizer:doubleTapGR];
}

/**
 缩放
 **/
- (void)setPinchGestureRecognizer {
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [self addGestureRecognizer:pinchGR];
}

/**
 移动
 **/
- (void)setPanGestureRecognizer {
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [self addGestureRecognizer:panGR];
}


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
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewDidZoom:state:scale:)]) {
        [self.delegate imageViewDidZoom:self state:pinchGR.state scale:pinchGR.scale];
    }
}

- (void)panView:(UIPanGestureRecognizer *)panGR {
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewDidMove:state:translation:)]) {
        [self.delegate imageViewDidMove:self state:panGR.state translation:[panGR translationInView:self]];
    }
}

@end
