//
//  SLBaseTableViewCell.m
//  SLStaticLibrary
//

#import "SLBaseTableViewCell.h"


@implementation SLBaseTableViewCell

- (instancetype)init {
    if (self = [super init]) {
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化 Cell View
        _didInitializeCellView = NO;
        [self initialize];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化 Cell View
        _didInitializeCellView = NO;
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

- (void)reloadCellViewWithModel:(SLBaseCellModel *)cellModel {
    // 请在子类中重写该方法
}

@end
