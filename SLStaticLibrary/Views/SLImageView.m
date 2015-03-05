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

- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super initWithImage:image]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    if (self = [super initWithImage:image highlightedImage:highlightedImage]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}


#pragma NSObject

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewBeginTouch:)]) {
        [self.delegate imageViewBeginTouch:self];
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
        if (self.delegate && [self.delegate respondsToSelector:@selector(imageViewDidTouched:)]) {
            [self.delegate imageViewDidTouched:self];
        }
    }
    
    // 重置是否移动中
    self.isMoving = NO;
}

@end
