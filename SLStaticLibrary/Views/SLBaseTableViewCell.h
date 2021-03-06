//
//  SLBaseTableViewCell.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>

@class SLBaseCellModel;


@interface SLBaseTableViewCell : UITableViewCell

// Cell 宽度（用于适配宽度）
@property (nonatomic, assign, readonly) CGFloat cellWidth;
// 是否已初始化界面
@property (nonatomic, assign, readonly) BOOL didInitializeCellView;

/**
 @param cellWidth Cell 宽度
 **/
- (instancetype)initWithCellWidth:(CGFloat)cellWidth style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

/**
 初始化 Cell VIew
 请在子类中重写该方法，无需另外调用
 **/
- (void)initializeCellView;

/**
 根据 Model 重新渲染 Cell View
 @param cellModel Cell Model
 **/
- (void)reloadCellViewWithModel:(id)cellModel;


/**
 获取 Cell Identifier
 **/
+ (NSString *)getCellIdentifier;

/**
 获取 Cell 高度
 @param cellModel Cell Model
 **/
+ (CGFloat)getCellHeightWithModel:(id)cellModel;

@end
