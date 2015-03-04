//
//  SLBaseTableViewCell.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>

@class SLBaseCellModel;


@interface SLBaseTableViewCell : UITableViewCell

/**
 初始化 Cell VIew
 **/
- (void)initializeCellView;

/**
 根据 Model 重新渲染 Cell View
 **/
- (void)reloadCellViewWithModel:(SLBaseCellModel *)model;

@end
