//
//  SLRootNavigationController.m
//  SLStaticLibrary
//

#import "SLRootNavigationController.h"


#define slMainScreenHeight [UIScreen mainScreen ].bounds.size.height
#define slApplicationWidth [UIScreen mainScreen ].applicationFrame.size.width
#define slNavigationBarHeight 44
#define slTabBarHeight 49


@interface SLRootNavigationController ()  <UINavigationControllerDelegate>

@property (nonatomic, strong) UIView *vTitle;
@property (nonatomic, strong) UIView *vLeft;
@property (nonatomic, strong) UIView *vRight;
@property (nonatomic, strong) UIView *vFull;

@end

@implementation SLRootNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    // 左右边栏各 1/3 屏幕宽度
    float viewWidth = slApplicationWidth / 3;
    return [self initWithRootViewController:rootViewController titleViewWidth:slApplicationWidth - viewWidth * 2];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController titleViewWidth:(float)width {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.delegate = self;
        
        // 计算各区域宽度
        self->_titleViewWidth = width;
        self->_leftViewWidth = (slApplicationWidth - width) / 2;
        self->_rightViewWidth = (slApplicationWidth - width) / 2;
        
        /* 初始化各区域 */
        self.vTitle = [[UIView alloc] initWithFrame:CGRectMake(self->_leftViewWidth, 0, self->_titleViewWidth, slNavigationBarHeight)];
        [self.navigationBar addSubview:self.vTitle];
        
        self.vLeft = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self->_leftViewWidth, slNavigationBarHeight)];
        [self.navigationBar addSubview:self.vLeft];
        
        self.vRight = [[UIView alloc] initWithFrame:CGRectMake(slApplicationWidth - self->_rightViewWidth, 0, self->_rightViewWidth, slNavigationBarHeight)];
        [self.navigationBar addSubview:self.vRight];
        
        self.vFull = [[UIView alloc] initWithFrame:CGRectMake(0, slApplicationWidth, 0, slNavigationBarHeight)];
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
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, slMainScreenHeight + slTabBarHeight)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, slMainScreenHeight)];
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

- (void)setBarItem:(SLRootNavigationBarType)navigationBarType button:(UIButton *)btn {
    [self clearBarItems:navigationBarType];
    
    [(navigationBarType == SLRootNavigationBarTypeLeft ? self.vLeft : self.vRight) addSubview:btn];
}

- (void)setBarItems:(SLRootNavigationBarType)navigationBarType buttonList:(NSArray *)btnList {
    [self clearBarItems:navigationBarType];
    
    for (UIButton *btn in btnList) {
        [(navigationBarType == SLRootNavigationBarTypeLeft ? self.vLeft : self.vRight) addSubview:btn];
    }
}


#pragma mark - Full View

- (void)showFullView {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"SLRootNavigationController" context:contextRef];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5f];
    
    self.vTitle.hidden = YES;
    self.vLeft.hidden = YES;
    self.vRight.hidden = YES;
    self.vFull.frame = CGRectMake(self.vFull.frame.origin.x, 0, slApplicationWidth, self.vFull.frame.size.height);
    
    [UIView commitAnimations];
}

- (void)hideFullView {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"SLRootNavigationController" context:contextRef];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5f];
    
    self.vTitle.hidden = NO;
    self.vLeft.hidden = NO;
    self.vRight.hidden = NO;
    self.vFull.frame = CGRectMake(self.vFull.frame.origin.x, slApplicationWidth, 0, self.vFull.frame.size.height);
    
    [UIView commitAnimations];
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
