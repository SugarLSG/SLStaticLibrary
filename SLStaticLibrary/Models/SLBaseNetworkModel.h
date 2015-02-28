//
//  SLBaseNetworkModel.h
//  SLStaticLibrary
//

#import <Foundation/Foundation.h>


@interface SLBaseNetworkModel : NSObject

@property (nonatomic, strong, readonly) id jsonModel;

- (instancetype)initWithJsonModel:(id)jsonModel;

- (void)setPropertyCorrespondences:(NSDictionary *)newPropertyCorrespondences;

@end
