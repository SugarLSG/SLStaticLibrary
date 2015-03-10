//
//  UIView+SLCategory.h
//  SLStaticLibrary
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SLViewInteractiveType) {
    SLViewInteractiveTypeNone = 0,
    SLViewInteractiveTypeClick = 1 << 0,
    SLViewInteractiveTypeDoubleClick = 1 << 1,
    SLViewInteractiveTypeZoom = 1 << 2,
    SLViewInteractiveTypeMove = 1 << 3
};


@interface UIView (SLCategory)

@end
