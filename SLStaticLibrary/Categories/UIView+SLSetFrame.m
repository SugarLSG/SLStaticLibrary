//
//  UIView+SLSetFrame.m
//  SLStaticLibrary
//

#import "UIView+SLSetFrame.h"


@implementation UIView (SLSetFrame)

- (CGFloat)originX {
    return self.frame.origin.x;
}

- (CGFloat)originY {
    return self.frame.origin.y;
}

- (CGFloat)finalX {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)finalY {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)sizeWidth {
    return self.frame.size.width;
}

- (CGFloat)sizeHeight {
    return self.frame.size.height;
}


- (void)setFrameX:(CGFloat)x {
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameY:(CGFloat)y {
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameWidth:(CGFloat)width {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (void)setFrameHeight:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}


- (void)setFrameX:(CGFloat)x y:(CGFloat)y {
    self.frame = CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameX:(CGFloat)x width:(CGFloat)width {
    self.frame = CGRectMake(x, self.frame.origin.y, width, self.frame.size.height);
}

- (void)setFrameX:(CGFloat)x height:(CGFloat)height {
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, height);
}

- (void)setFrameY:(CGFloat)y width:(CGFloat)width {
    self.frame = CGRectMake(self.frame.origin.x, y, width, self.frame.size.height);
}

- (void)setFrameY:(CGFloat)y height:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, height);
}

- (void)setFrameWidth:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
}


- (void)setFrameX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width {
    self.frame = CGRectMake(x, y, width, self.frame.size.height);
}

- (void)setFrameX:(CGFloat)x y:(CGFloat)y height:(CGFloat)height {
    self.frame = CGRectMake(x, y, self.frame.size.width, height);
}

- (void)setFrameX:(CGFloat)x width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(x, self.frame.origin.y, width, height);
}

- (void)setFrameY:(CGFloat)y width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, y, width, height);
}

@end
