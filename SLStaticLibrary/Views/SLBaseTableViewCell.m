//
//  SLBaseTableViewCell.m
//  SLStaticLibrary
//

#import "SLBaseTableViewCell.h"
#import "SLStaticLibrary.h"


@implementation SLBaseTableViewCell

- (instancetype)init {
    if (self = [super init]) {
        // 默认屏幕宽度
        _cellWidth = applicationWidth;
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self layoutIfNeeded];
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        // 默认屏幕宽度
        _cellWidth = applicationWidth;
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self layoutIfNeeded];
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 默认屏幕宽度
        _cellWidth = applicationWidth;
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self layoutIfNeeded];
        [self initialize];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 默认屏幕宽度
        _cellWidth = applicationWidth;
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self layoutIfNeeded];
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCellWidth:(CGFloat)cellWidth style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _cellWidth = cellWidth;
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self layoutIfNeeded];
        [self initialize];
    }
    return self;
}

- (void)initialize {
    if (!self.didInitializeCellView) {
        // 实际是调用了子类的方法
        [self initializeCellView];
        _didInitializeCellView = YES;
    }
}

- (void)initializeCellView {
    // 请在子类中重写该方法
}

- (void)reloadCellViewWithModel:(id)cellModel {
    // 请在子类中重写该方法
}


+ (NSString *)getCellIdentifier {
    return [NSString stringWithFormat:@"%@Identifier", NSStringFromClass(self)];
}

+ (CGFloat)getCellHeightWithModel:(id)cellModel {
    return 0;
}

@end
