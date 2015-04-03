//
//  NSDate+SLCategory.m
//  SLStaticLibrary
//
//  Created by mc.sugar on 15/4/3.
//
//

#import "NSDate+SLCategory.h"


@implementation NSDate (SLCategory)

+ (NSDate *)convertDate:(NSString *)valueString formatString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    
    return [dateFormatter dateFromString:valueString];
}


- (NSString *)toString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    
    return [dateFormatter stringFromDate:self];
}

@end
