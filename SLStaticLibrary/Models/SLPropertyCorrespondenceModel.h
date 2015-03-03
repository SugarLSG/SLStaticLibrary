//
//  SLPropertyCorrespondenceModel.h
//  SLStaticLibrary
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, PropertyType) {
    PropertyTypeItem,
    PropertyTypeArray
};


@interface SLPropertyCorrespondenceModel : NSObject

// 对应的 Key
@property (nonatomic, strong, readonly) NSString *key;
// 属性类型，除了自定义类型（需继承自 SLBaseNetworkModel）和数组外，其他均为 Base
@property (nonatomic, assign, readonly) PropertyType propertyType;
// 当属性类型为数组时，指定每个 Item 类型（可空，若指定需继承自 SLBaseNetworkModel）
@property (nonatomic, strong, readonly) NSString *customModelName;

+ (instancetype)correspondenceWithKey:(NSString *)key propertyType:(PropertyType)propertyType;
+ (instancetype)correspondenceWithKey:(NSString *)key propertyType:(PropertyType)propertyType customModelName:(NSString *)customModelName;

@end
