//
//  SLBaseTableViewCell.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>

@class SLBaseCellModel;


@interface SLBaseTableViewCell : UITableViewCell

// 是否已初始化界面
@property (nonatomic, assign, readonly) BOOL didInitializeCellView;

/**
 初始化 Cell VIew
 请在子类中重写该方法，无需另外调用
 **/
- (void)initializeCellView;

/**
 根据 Model 重新渲染 Cell View
 @param cellModel Cell Model
 **/
- (void)reloadCellViewWithModel:(SLBaseCellModel *)cellModel;

@end
