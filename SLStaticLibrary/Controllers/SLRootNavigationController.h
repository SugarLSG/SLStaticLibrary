//
//  SLRootNavigationController.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SLRootNavigationBarType) {
    SLRootNavigationBarTypeLeft,   // left bar
    SLRootNavigationBarTypeRight   // right bar
};

/**
 Full View 区域运动方向
 **/
typedef NS_ENUM(NSInteger, SLRootNavigationFullViewDirection) {
    SLRootNavigationFullViewDirectionNone,
    SLRootNavigationFullViewDirectionLeftToRight,
    SLRootNavigationFullViewDirectionRightToLeft,
    SLRootNavigationFullViewDirectionTopToBottom,
    SLRootNavigationFullViewDirectionBottomToTop
};


@interface SLRootNavigationController : UINavigationController

@property (nonatomic, assign, readonly) float titleViewWidth;   // 标题区域宽度
@property (nonatomic, assign, readonly) float leftViewWidth;    // 左边栏区域宽度
@property (nonatomic, assign, readonly) float rightViewWidth;   // 右边栏区域宽度
@property (nonatomic, assign) BOOL hideTabBar;                      // 隐藏 TabBar


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController titleViewWidth:(float)width;

/**
 清除标题
 **/
- (void)clearTitle;
/**
 设置文字标题
 **/
- (void)setStringTitle:(NSString *)strTitle;
/**
 设置图片标题
 **/
- (void)setImageTitle:(UIImageView *)ivTitle;
/**
 设置按钮标题
 **/
- (void)setButtonTitle:(UIButton *)btnTitle;

/**
 清除所有边栏按钮
 **/
- (void)clearBarItems:(SLRootNavigationBarType)navigationBarType;
/**
 设置边栏按钮
 **/
- (void)setBarItem:(SLRootNavigationBarType)navigationBarType button:(UIButton *)btn;
/**
 设置边栏按钮列
 **/
- (void)setBarItems:(SLRootNavigationBarType)navigationBarType buttonList:(NSArray *)btnList;

/**
 显示 Full View 区域
 **/
- (void)showFullViewWithAnimatedIn:(SLRootNavigationFullViewDirection)direction completion:(void(^)())completion;
/**
 隐藏 Full View 区域
 **/
- (void)hideFullViewWithAnimatedOut:(SLRootNavigationFullViewDirection)direction completion:(void(^)())completion;
/**
 清除 Full View 区域
 **/
- (void)clearFullView;
/**
 设置 Full View 区域视图
 **/
- (void)setFullView:(UIView *)subview;

@end
