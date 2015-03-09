//
//  SLRootNavigationController.m
//  SLStaticLibrary
//

#import "SLRootNavigationController.h"
#import "SLStaticLibrary.h"


@interface SLRootNavigationController ()  <UINavigationControllerDelegate>

@property (nonatomic, strong) UIView *vTitle;
@property (nonatomic, strong) UIView *vLeft;
@property (nonatomic, strong) UIView *vRight;
@property (nonatomic, strong) UIView *vFull;

@end

@implementation SLRootNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    // 左右边栏各 1/3 屏幕宽度
    float viewWidth = applicationWidth / 3;
    return [self initWithRootViewController:rootViewController titleViewWidth:applicationWidth - viewWidth * 2];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController titleViewWidth:(float)width {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.delegate = self;
        
        // Bar Item 间距
        self.barItemMargin = 5;
        
        // 计算各区域宽度
        self->_titleViewWidth = width;
        self->_leftViewWidth = (applicationWidth - width) / 2;
        self->_rightViewWidth = (applicationWidth - width) / 2;
        
        /* 初始化各区域 */
        self.vTitle = [[UIView alloc] initWithFrame:CGRectMake(self->_leftViewWidth, 0, self->_titleViewWidth, navigationBarHeight)];
        self.vTitle.alpha = 1;
        [self.navigationBar addSubview:self.vTitle];
        
        self.vLeft = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self->_leftViewWidth, navigationBarHeight)];
        self.vLeft.alpha = 1;
        [self.navigationBar addSubview:self.vLeft];
        
        self.vRight = [[UIView alloc] initWithFrame:CGRectMake(applicationWidth - self->_rightViewWidth, 0, self->_rightViewWidth, navigationBarHeight)];
        self.vRight.alpha = 1;
        [self.navigationBar addSubview:self.vRight];
        
        self.vFull = [[UIView alloc] initWithFrame:CGRectMake(0, 0, applicationWidth, navigationBarHeight)];
        self.vFull.alpha = 0;
        self.vFull.hidden = YES;
        [self.navigationBar addSubview:self.vFull];
    }
    return self;
}


#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.navigationItem.hidesBackButton = YES;
}


#pragma mark - Public Methods

- (void)setHideTabBar:(BOOL)hideTabBar {
    self->_hideTabBar = hideTabBar;
    self.tabBarController.tabBar.hidden = hideTabBar;
    
    for (UIView *view in self.tabBarController.view.subviews) {
        // UITransitionView 视图为 UINavitaionController 的根视图
        if ([view isKindOfClass:NSClassFromString(@"UITransitionView")]) {
            if (hideTabBar) {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, mainScreenHeight + tabBarHeight)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, mainScreenHeight)];
            }
        }
    }
}


#pragma mark - Title

- (void)clearTitle {
    if (self.vTitle) {
        for (UIView *view in self.vTitle.subviews) {
            [view removeFromSuperview];
        }
    }
}

- (void)setStringTitle:(NSString *)strTitle {
    [self clearTitle];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.vTitle.frame.size.width, self.vTitle.frame.size.height)];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.text = strTitle;
    lblTitle.textColor = [UIColor whiteColor];
    [self.vTitle addSubview:lblTitle];
}

- (void)setImageTitle:(UIImageView *)ivTitle {
    [self clearTitle];
    
    [self.vTitle addSubview:ivTitle];
}

- (void)setButtonTitle:(UIButton *)btnTitle {
    [self clearTitle];
    
    [self.vTitle addSubview:btnTitle];
}


#pragma mark - Bar Item

- (void)clearBarItems:(SLRootNavigationBarType)navigationBarType {
    if (self.vLeft) {
        for (UIView *view in (navigationBarType == SLRootNavigationBarTypeLeft ? self.vLeft.subviews : self.vRight.subviews)) {
            [view removeFromSuperview];
        }
    }
}

- (void)clearAllBarItems {
    [self clearBarItems:SLRootNavigationBarTypeLeft];
    [self clearBarItems:SLRootNavigationBarTypeRight];
}

- (void)setBarItem:(SLRootNavigationBarType)navigationBarType button:(UIButton *)btn {
    [self clearBarItems:navigationBarType];
    
    if (navigationBarType == SLRootNavigationBarTypeLeft) {
        btn.frame = CGRectMake(self.barItemMargin, (navigationBarHeight - btn.frame.size.height) / 2, btn.frame.size.width, btn.frame.size.height);
        [self.vLeft addSubview:btn];
    } else {
        btn.frame = CGRectMake(self.rightViewWidth - btn.frame.size.width - self.barItemMargin, (navigationBarHeight - btn.frame.size.height) / 2, btn.frame.size.width, btn.frame.size.height);
        [self.vRight addSubview:btn];
    }
}

- (void)setBarItems:(SLRootNavigationBarType)navigationBarType buttonList:(NSArray *)btnList {
    [self clearBarItems:navigationBarType];
    
    float currentMargin = self.barItemMargin;
    for (UIButton *btn in btnList) {
        if (navigationBarType == SLRootNavigationBarTypeLeft) {
            btn.frame = CGRectMake(currentMargin, (navigationBarHeight - btn.frame.size.height) / 2, btn.frame.size.width, btn.frame.size.height);
            [self.vLeft addSubview:btn];
        } else {
            btn.frame = CGRectMake(self.rightViewWidth - btn.frame.size.width - currentMargin, (navigationBarHeight - btn.frame.size.height) / 2, btn.frame.size.width, btn.frame.size.height);
            [self.vRight addSubview:btn];
        }
        
        currentMargin += (btn.frame.size.width + self.barItemMargin);
    }
}


#pragma mark - Full View

- (void)showFullViewWithAnimatedIn:(SLRootNavigationFullViewDirection)direction completion:(void(^)())completion {
    if (!self.vFull.alpha) {
        // 未显示，设置开始位置
        switch (direction) {
            case SLRootNavigationFullViewDirectionNone:
                self.vFull.frame = CGRectMake(0, 0, self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
            case SLRootNavigationFullViewDirectionLeftToRight:
                self.vFull.frame = CGRectMake(-applicationWidth, 0, self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
            case SLRootNavigationFullViewDirectionRightToLeft:
                self.vFull.frame = CGRectMake(applicationWidth, 0, self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
            case SLRootNavigationFullViewDirectionTopToBottom:
                self.vFull.frame = CGRectMake(0, -(statusBarHeight + navigationBarHeight), self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
            case SLRootNavigationFullViewDirectionBottomToTop:
                self.vFull.frame = CGRectMake(0, navigationBarHeight, self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
        }
    }
    
    // 开始动画
    [UIView animateWithDuration:0.5f animations:^{
        self.vTitle.alpha = 0;
        self.vLeft.alpha = 0;
        self.vRight.alpha = 0;
        self.vFull.frame = CGRectMake(0, 0, self.vFull.frame.size.width, self.vFull.frame.size.height);
        self.vFull.alpha = 1;
        self.vFull.hidden = NO;
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)hideFullViewWithAnimatedOut:(SLRootNavigationFullViewDirection)direction completion:(void(^)())completion {
    // 开始动画
    [UIView animateWithDuration:0.5f animations:^{
        self.vTitle.alpha = 1;
        self.vLeft.alpha = 1;
        self.vRight.alpha = 1;
        // 设置结束位置
        switch (direction) {
            case SLRootNavigationFullViewDirectionNone:
                self.vFull.frame = CGRectMake(0, 0, self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
            case SLRootNavigationFullViewDirectionLeftToRight:
                self.vFull.frame = CGRectMake(applicationWidth, 0, self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
            case SLRootNavigationFullViewDirectionRightToLeft:
                self.vFull.frame = CGRectMake(-applicationWidth, 0, self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
            case SLRootNavigationFullViewDirectionTopToBottom:
                self.vFull.frame = CGRectMake(0, navigationBarHeight, self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
            case SLRootNavigationFullViewDirectionBottomToTop:
                self.vFull.frame = CGRectMake(0, -(statusBarHeight + navigationBarHeight), self.vFull.frame.size.width, self.vFull.frame.size.height);
                break;
        }
        self.vFull.alpha = 0;
    } completion:^(BOOL finished) {
        self.vFull.hidden = YES;
        
        if (completion) {
            completion();
        }
    }];
}

- (void)clearFullView {
    if (self.vFull) {
        for (UIView *view in self.vFull.subviews) {
            [view removeFromSuperview];
        }
    }
}

- (void)setFullView:(UIView *)subview {
    [self clearFullView];
    
    [self.vFull addSubview:subview];
}

@end
