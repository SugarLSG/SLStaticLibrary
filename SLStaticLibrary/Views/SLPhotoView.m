//
//  SLPhotoView.m
//  SLStaticLibrary
//

#import "SLPhotoView.h"
#import "SLStaticLibrary.h"
#import "SLImageView.h"
#import "SLNetworkHelper.h"


@interface SLPhotoView () <SLImageViewDelegate>

@property (nonatomic, strong) SLImageView *ivPhoto;
@property (nonatomic, strong) UIButton *btnPrev;
@property (nonatomic, strong) UIButton *btnNext;

@property (nonatomic, assign) CGSize sIvPhotoMinSize;
@property (nonatomic, assign) CGSize sIvPhotoMaxSize;
@property (nonatomic, assign) CGFloat fIvPhotoLastScale;
@property (nonatomic, assign) CGPoint pIvPhotoLastTranslation;

@end


@implementation SLPhotoView

- (instancetype)init {
    if (self = [super init]) {
        [self initializeView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initializeView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializeView];
    }
    return self;
}

- (instancetype)initWithPlaceholderImg:(UIImage *)imgPlaceholder brokenImg:(UIImage *)imgBroken imgUrlArray:(NSArray *)imgUrls {
    if (self = [super init]) {
        self.imgPlaceholder = imgPlaceholder;
        self.imgBroken = imgBroken;
        self.imgUrls = imgUrls;
        
        [self initializeView];
    }
    return self;
}

- (void)initializeView {
    // 背景色
    self.backgroundColor = [UIColor blackColor];
    
    /* 初始化界面 */
    // 图片
    self.ivPhoto = [[SLImageView alloc] initWithFrame:CGRectZero];
    self.ivPhoto.delegate = self;
    [self setImageViewFrame:self.imgPlaceholder];
    self.ivPhoto.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.ivPhoto];
    
    // 上一张
    self.btnPrev = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPrev.frame = CGRectMake(5, (applicationHeight - navigationBarHeight - 40) / 2, 40, 40);
    self.btnPrev.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    self.btnPrev.layer.cornerRadius = self.btnPrev.frame.size.width / 2;
    self.btnPrev.hidden = YES;
    [self.btnPrev setTitle:@"<" forState:UIControlStateNormal];
    [self.btnPrev addTarget:self action:@selector(btnPrevClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnPrev];
    
    // 下一张
    self.btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnNext.frame = CGRectMake(applicationWidth - 40 - 10, self.btnPrev.frame.origin.y, self.btnPrev.frame.size.width, self.btnPrev.frame.size.height);
    self.btnNext.backgroundColor = self.btnPrev.backgroundColor;
    self.btnNext.layer.cornerRadius = self.btnNext.frame.size.width / 2;
    self.btnNext.hidden = YES;
    [self.btnNext setTitle:@">" forState:UIControlStateNormal];
    [self.btnNext addTarget:self action:@selector(btnNextClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnNext];
}


#pragma mark - Button Click

- (void)btnPrevClick:(UIButton *)btn {
    if (--self.imgIndex < 0) {
        self.imgIndex = 0;
    }
    
    [self show];
}

- (void)btnNextClick:(UIButton *)btn {
    if (!self.imgUrls) {
        self.imgIndex = 0;
    } else {
        if (++self.imgIndex >= self.imgUrls.count) {
            self.imgIndex = self.imgUrls.count - 1;
        }
    }
    
    [self show];
}


#pragma mark - Show Photo

- (void)setImageViewFrame:(UIImage *)img {
    //  先调整为最小尺寸，再换图片
    if (self.ivPhoto.frame.size.width > self.sIvPhotoMinSize.width) {
        CGFloat scale = self.sIvPhotoMinSize.width / self.ivPhoto.frame.size.width;
        self.ivPhoto.transform = CGAffineTransformScale(self.ivPhoto.transform, scale, scale);
    }
    
    // 设置图片显示
    if (img) {
        self.ivPhoto.image = img;
    }
    if (self.ivPhoto.image) {
        CGFloat contentWidth = applicationHeight - navigationBarHeight;
        CGFloat widthScale = applicationWidth / self.ivPhoto.image.size.width;
        CGFloat heightScale = contentWidth / self.ivPhoto.image.size.height;
        // 最小尺寸为最小适配屏幕大小 或 原始尺寸中，小的那个
        self.sIvPhotoMinSize = CGSizeMake(MIN(self.ivPhoto.image.size.width,  self.ivPhoto.image.size.width * MIN(widthScale, heightScale)), MIN(self.ivPhoto.image.size.height,  self.ivPhoto.image.size.height * MIN(widthScale, heightScale)));
        // 最大尺寸为最大适配屏幕2倍大小 或 原始尺寸中，大的那个
        self.sIvPhotoMaxSize = CGSizeMake(MAX(self.ivPhoto.image.size.width, self.ivPhoto.image.size.width * MAX(widthScale, heightScale) * 2), MAX(self.ivPhoto.image.size.height, self.ivPhoto.image.size.height * MAX(widthScale, heightScale) * 2));
        
        self.ivPhoto.frame = CGRectMake((applicationWidth - self.sIvPhotoMinSize.width) / 2, (contentWidth - self.sIvPhotoMinSize.height) / 2, self.sIvPhotoMinSize.width, self.sIvPhotoMinSize.height);
    }
}

- (void)show {
    if (self.delegate && [self.delegate respondsToSelector:@selector(photoView:didShowPhotoIndex:totalCount:)]) {
        [self.delegate photoView:self didShowPhotoIndex:self.imgIndex totalCount:self.imgUrls ? self.imgUrls.count : 0];
    }
    
    if (!self.imgUrls) {
        [self setImageViewFrame:self.imgBroken];
        self.btnPrev.hidden = YES;
        self.btnNext.hidden = YES;
    } else {
        [SLNetworkHelper getImageWithUrl:self.imgUrls[self.imgIndex] success:^(UIImage *image) {
            [self setImageViewFrame:image];
        } failure:nil];
        
        self.btnPrev.hidden = self.imgIndex <= 0;
        self.btnNext.hidden = self.imgIndex >= self.imgUrls.count - 1;
    }
}


#pragma mark - SLImageViewDelegate

- (void)scalePhotoTransform:(CGFloat)scale {
    CGFloat contentWidth = applicationHeight - navigationBarHeight;
    CGFloat halfWidth = self.ivPhoto.frame.size.width * scale / 2;
    CGFloat halfGeight = self.ivPhoto.frame.size.height * scale / 2;
    CGFloat marginX = MAX(0, (applicationWidth - self.ivPhoto.frame.size.width * scale) / 2);
    CGFloat marginY = MAX(0, (contentWidth - self.ivPhoto.frame.size.height * scale) / 2);
    CGPoint newCenter = self.ivPhoto.center;
    BOOL isChange = NO;
    // 太偏左
    if (self.ivPhoto.center.x + halfWidth + marginX < applicationWidth) {
        newCenter.x += (applicationWidth - (self.ivPhoto.center.x + halfWidth + marginX));
        isChange = YES;
    }
    // 太偏右
    if (self.ivPhoto.center.x - halfWidth - marginX > 0) {
        newCenter.x -= ((self.ivPhoto.center.x - halfWidth - marginX) - 0);
        isChange = YES;
    }
    // 太偏上
    if (self.ivPhoto.center.y + halfGeight + marginY < contentWidth) {
        newCenter.y += (contentWidth - (self.ivPhoto.center.y + halfGeight + marginY));
        isChange = YES;
    }
    // 太偏下
    if (self.ivPhoto.center.y - halfGeight - marginY > 0) {
        newCenter.y -= ((self.ivPhoto.center.y - halfGeight - marginY) - 0);
        isChange = YES;
    }
    
    if (scale != 1 || isChange) {
        [UIView animateWithDuration:0.5f animations:^{
            // 长宽均放大缩小相同比例
            self.ivPhoto.transform = CGAffineTransformScale(self.ivPhoto.transform, scale, scale);
            // 平移到适合位置
            self.ivPhoto.center = newCenter;
        }];
    }
}

- (void)imageViewDidDoubleClick:(SLImageView *)imageView {
    CGFloat newScale = 1;
    if (self.ivPhoto.frame.size.width != self.sIvPhotoMaxSize.width) {
        // 不等于最大尺寸，调整为最大尺寸
        newScale = self.sIvPhotoMaxSize.width / self.ivPhoto.frame.size.width;
    } else if (self.ivPhoto.frame.size.width > self.sIvPhotoMinSize.width) {
        // 大于最小尺寸，调整为最小尺寸
        newScale = self.sIvPhotoMinSize.height / self.ivPhoto.frame.size.height;
    }
    
    [self scalePhotoTransform:newScale];
}

- (void)imageViewDidZoom:(SLImageView *)imageView state:(UIGestureRecognizerState)state scale:(CGFloat)scale {
    if (state == UIGestureRecognizerStateBegan) {
        self.fIvPhotoLastScale = scale;
    } else if (state == UIGestureRecognizerStateEnded) {
        CGFloat newScale = 1;
        if (self.ivPhoto.frame.size.width < self.sIvPhotoMinSize.width) {
            // 小于最小尺寸，调整为最小尺寸
            newScale = self.sIvPhotoMinSize.width / self.ivPhoto.frame.size.width;
        } else if (self.ivPhoto.frame.size.width > self.sIvPhotoMaxSize.width) {
            // 大于最大尺寸，调整为最大尺寸
            newScale = self.sIvPhotoMaxSize.height / self.ivPhoto.frame.size.height;
        }
        
        [self scalePhotoTransform:newScale];
    } else if (state == UIGestureRecognizerStateChanged) {
        CGFloat newScale = scale - self.fIvPhotoLastScale + 1;
        self.ivPhoto.transform = CGAffineTransformScale(self.ivPhoto.transform ,newScale, newScale);
        self.fIvPhotoLastScale = scale;
    }
}

- (void)imageViewDidMove:(SLImageView *)imageView state:(UIGestureRecognizerState)state translation:(CGPoint)translation {
    if (state == UIGestureRecognizerStateBegan) {
        self.pIvPhotoLastTranslation = translation;
    } else if (state == UIGestureRecognizerStateEnded) {
        [self  scalePhotoTransform:1];
    } else if (state == UIGestureRecognizerStateChanged) {
        // 放大后的位移距离，应与放大倍数相对应
        CGFloat multiple = self.ivPhoto.frame.size.width / self.sIvPhotoMinSize.width;
        self.ivPhoto.center = CGPointMake(self.ivPhoto.center.x + (translation.x - self.pIvPhotoLastTranslation.x) * multiple, self.ivPhoto.center.y + (translation.y - self.pIvPhotoLastTranslation.y) * multiple);
        self.pIvPhotoLastTranslation = translation;
    }
}

@end
