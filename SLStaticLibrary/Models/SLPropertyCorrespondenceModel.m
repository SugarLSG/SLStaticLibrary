//
//  SLPropertyCorrespondenceModel.m
//  SLStaticLibrary
//

#import "SLPropertyCorrespondenceModel.h"


@implementation SLPropertyCorrespondenceModel

+ (instancetype)correspondenceWithKey:(NSString *)key propertyType:(PropertyType)propertyType {
    return [self correspondenceWithKey:key propertyType:propertyType customModelName:nil];
}

+ (instancetype)correspondenceWithKey:(NSString *)key propertyType:(PropertyType)propertyType customModelName:(NSString *)customModelName {
    SLPropertyCorrespondenceModel *model = [[SLPropertyCorrespondenceModel alloc] init];
    model->_key = key;
    model->_propertyType = propertyType;
    model->_customModelName = customModelName;
    
    return model;
}

@end
