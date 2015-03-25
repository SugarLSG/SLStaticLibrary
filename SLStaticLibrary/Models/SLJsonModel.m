//
//  SLJsonModel.m
//  SLStaticLibrary
//

#import "SLJsonModel.h"
#import <objc/runtime.h>


@interface SLJsonModel ()

@property (nonatomic, strong) NSArray *ignoreProperties;
@property (nonatomic, strong) NSDictionary *propertyCorrespondences;

@end


@implementation SLJsonModel

- (instancetype)initWithJsonModel:(id)jsonModel {
    if (self = [super init]) {
        self->_jsonModel = jsonModel;
        
        // 转换为对应 Model
        if (jsonModel) {
            // 获取该类所有属性
            uint count = 0;
            objc_property_t *properties = class_copyPropertyList([self class], &count);
            
            // 解析
            for (int i = 0; i < count; ++i) {
                // 获取属性名
                NSString *propertyName = [NSString stringWithUTF8String:property_getName(properties[i])];
                
                // 是否忽略序列化该属性
                if (self.ignoreProperties && [self.ignoreProperties containsObject:propertyName]) {
                    continue;
                }
                
                // 是否在子类中有进行转换设置
                SLPropertyCorrespondenceModel *correspondence = self.propertyCorrespondences && [self.propertyCorrespondences.allKeys containsObject:propertyName] ?
                    self.propertyCorrespondences[propertyName]:
                    [SLPropertyCorrespondenceModel correspondenceWithKey:propertyName propertyType:SLPropertyTypeItem];
                
                // 转换值
                switch (correspondence.propertyType) {
                    case SLPropertyTypeItem: {
                        // Item 类型，根据属性的类型，判断是否转换后赋值
                        id data = [jsonModel objectForKey:correspondence.key];
                        
                        // 获取属性类型
                        char *pt = property_copyAttributeValue(properties[i], "T");
                        NSString *propertyType = [[[NSString stringWithUTF8String:pt]
                                                   stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@"]]
                                                  stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\""]];
                        free(pt);
                        
                        // 是否有设置对应属性类型
                        if (correspondence.customModelName) {
                            // 有，检查是否声明的属性类型的子类，并且为指定类型的子类
                            Class customModelClass = NSClassFromString(correspondence.customModelName);
                            if ([customModelClass isSubclassOfClass:[SLJsonModel class]] &&
                                [customModelClass isSubclassOfClass:[SLJsonModel class]]) {
                                [self setValue:[[customModelClass alloc] initWithJsonModel:data] forKey:propertyName];
                                continue;
                            }
                        } else {
                            // 无，检查是否为指定类型的子类
                            if (propertyType && [NSClassFromString(propertyType) isSubclassOfClass:[SLJsonModel class]]) {
                                [self setValue:[[NSClassFromString(propertyType) alloc] initWithJsonModel:data] forKey:propertyName];
                                continue;
                            }
                        }
                        [self setValue:data forKey:propertyName];
                        
                        break;
                    }
                        
                    case SLPropertyTypeArray: {
                        // 数组类型，根据设置的类型，判断是否转换后赋值
                        NSArray *array = (NSArray *)[jsonModel objectForKey:correspondence.key];
                        
                        // 是否为指定类型的子类
                        if (correspondence.customModelName && [NSClassFromString(correspondence.customModelName) isSubclassOfClass:[SLJsonModel class]]) {
                            NSMutableArray *models = [[NSMutableArray alloc] init];
                            for (id data in array) {
                                [models addObject:[[NSClassFromString(correspondence.customModelName) alloc] initWithJsonModel:data]];
                            }
                            [self setValue:models forKey:propertyName];
                        } else {
                            [self setValue:array forKey:propertyName];
                        }
                        
                        break;
                    }
                }
            }
            free(properties);
        }
    }
    return self;
}

@end
