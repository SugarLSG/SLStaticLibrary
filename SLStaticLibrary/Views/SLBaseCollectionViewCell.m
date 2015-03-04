//
//  SLBaseCollectionViewCell.m
//  SLStaticLibrary
//

#import "SLBaseCollectionViewCell.h"


@implementation SLBaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化 Cell View
        // 实际是调用了子类的方法
        [self initializeCellView];
    }
    return self;
}

- (void)initializeCellView {
    // 请在子类中重新该方法
}

- (void)reloadCellViewWithModel:(SLBaseCellModel *)model {
    // 请在子类中重新该方法
}

@end
