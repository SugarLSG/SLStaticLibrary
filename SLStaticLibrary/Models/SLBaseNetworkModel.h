//
//  SLBaseNetworkModel.h
//  SLStaticLibrary
//

#import <Foundation/Foundation.h>
#import "SLPropertyCorrespondenceModel.h"


@interface SLBaseNetworkModel : NSObject

@property (nonatomic, strong, readonly) id jsonModel;   // 原 Json 数据

- (instancetype)initWithJsonModel:(id)jsonModel;

/**
 设置忽略序列化的属性列表，需在 initWithJsonModel: 前调用
 @param ignoreProperties 忽略属性列表
 **/
- (void)setIgnoreProperties:(NSArray *)ignoreProperties;
/**
 设置属性配置，SLPropertyCorrespondenceModel 类型，需在 initWithJsonModel: 前调用
 @param propertyCorrespondences 属性配置列表
 **/
- (void)setPropertyCorrespondences:(NSDictionary *)propertyCorrespondences;

@end
