//
//  SLStaticLibrary.h
//  SLStaticLibrary
//

/* import */
#import "UIColor+SLCategory.h"

/* log */
#ifdef DEBUG
    #define DebugLog(format, ...) NSLog(@"<%@ - line:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(format), ##__VA_ARGS__])
    #define DebugLogPoint(point) DebugLog(@"x: %f; y: %f;", (point).x, (point).y)
    #define DebugLogSize(size) DebugLog(@"w: %f; h: %f;", (size).width, (size).height)
    #define DebugLogRect(rect) DebugLog(@"x: %f; y: %f; w: %f; h: %f;", (rect).origin.x, (rect).origin.y, (rect).size.width, (rect).size.height)
#else
    #define DebugLog(format, ...)
    #define DebugLogPoint(point)
    #define DebugLogSize(size)
    #define DebugLogRect(rect)
#endif

/* size */
#define mainScreenWidth [UIScreen mainScreen ].bounds.size.width
#define mainScreenHeight [UIScreen mainScreen ].bounds.size.height
#define statusBarWidth [UIApplication sharedApplication].statusBarFrame.size.width
#define statusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define applicationWidth [UIScreen mainScreen ].applicationFrame.size.width
#define applicationHeight [UIScreen mainScreen ].applicationFrame.size.height
#define navigationBarHeight 44
#define tabBarHeight 49

/* system version */
#define systemVersion [[UIDevice currentDevice].systemVersion floatValue]

/* the app delegate */
#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

/* app color */
#define generateColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define generateColorWithHexValue(v, a) [UIColor colorWithHexValue:(v) alpha:(a)]
