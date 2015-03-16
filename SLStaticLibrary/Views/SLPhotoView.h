//
//  SLPhotoView.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>

@class SLPhotoView;


@protocol SLPhotoViewDelegate <NSObject>

@optional
- (void)photoView:(SLPhotoView *)photoView didShowPhotoIndex:(NSUInteger)index totalCount:(NSUInteger)count;

@end


@interface SLPhotoView : UIView

@property (nonatomic, strong) UIImage *imgPlaceholder;    // 占位图片
@property (nonatomic, strong) UIImage *imgBroken;          // 加载失败图片
@property (nonatomic, strong) NSArray *imgUrls;            // 图片路径数组
@property (nonatomic, assign) NSInteger imgIndex;           // 显示的图片
@property (nonatomic, strong) id<SLPhotoViewDelegate> delegate;

- (instancetype)initWithPlaceholderImg:(UIImage *)imgPlaceholder brokenImg:(UIImage *)imgBroken imgUrlArray:(NSArray *)imgUrls imgIndex:(NSInteger)imgIndex;

- (void)show;

@end
