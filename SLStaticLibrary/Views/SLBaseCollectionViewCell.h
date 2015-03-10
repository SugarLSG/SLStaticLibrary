//
//  SLBaseCollectionViewCell.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>

@class SLBaseCellModel;


@interface SLBaseCollectionViewCell : UICollectionViewCell

/**
 初始化 Cell VIew
 **/
- (void)initializeCellView;

/**
 根据 Model 重新渲染 Cell View
 **/
- (void)reloadCellViewWithModel:(SLBaseCellModel *)cellModel;

@end
