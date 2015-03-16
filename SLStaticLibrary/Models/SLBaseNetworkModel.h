//
//  SLBaseNetworkModel.h
//  SLStaticLibrary
//

#import <Foundation/Foundation.h>
#import "SLPropertyCorrespondenceModel.h"


@interface SLBaseNetworkModel : NSObject

@property (nonatomic, strong, readonly) id jsonModel;   // 原 Json 数据

- (instancetype)initWithJsonModel:(id)jsonModel;

// 设置忽略序列号的属性列表，需在 initWithJsonModel: 前调用
- (void)setIgnoreProperties:(NSArray *)ignoreProperties;
// 设置属性配置，SLPropertyCorrespondenceModel 类型，需在 initWithJsonModel: 前调用
- (void)setPropertyCorrespondences:(NSDictionary *)newPropertyCorrespondences;

@end
