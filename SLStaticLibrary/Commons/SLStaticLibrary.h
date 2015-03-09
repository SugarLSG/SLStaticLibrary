//
//  SLStaticLibrary.h
//  SLStaticLibrary
//

/* Log */
#ifdef DEBUG
    #define DebugLog(format, ...) NSLog(@"<%@ - line:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(format), ##__VA_ARGS__])
    #define DebugLogPoint(point) DebugLog(@"x: %f; y: %f;", (point).x, (point).y)
    #define DebugLogSize(size) DebugLog(@"w: %f; h: %f;", (size).width, (size).height)
    #define DebugLogFrame(frame) DebugLog(@"x: %f; y: %f; w: %f; h: %f;", (frame).origin.x, (frame).origin.y, (frame).size.width, (frame).size.height)
#else
    #define DebugLog(format, ...)
    #define DebugLogPoint(point)
    #define DebugLogSize(size)
    #define DebugLogFrame(frame)
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
