//
//  NSBezierPath+CGPath.m
//  MacOSBrush
//
//  Created by neo on 05.07.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "NSBezierPath+CGPath.h"
#import <objc/runtime.h>

static const char *key = "NSBezierPath_CGPath";

@implementation NSBezierPath (CGPath)

- (CGPathRef)CGPath {
    
    CGMutablePathRef path = CGPathCreateMutable();
    NSPoint p[3];
    BOOL closed = NO;
    
    NSInteger elementCount = [self elementCount];
    
    for (NSInteger i = 0; i < elementCount; i++) {
        
        switch ([self elementAtIndex:i associatedPoints:p]) {
            case NSMoveToBezierPathElement:
                CGPathMoveToPoint(path, NULL, p[0].x, p[0].y);
                break;
                
            case NSLineToBezierPathElement:
                CGPathAddLineToPoint(path, NULL, p[0].x, p[0].y);
                closed = NO;
                break;
                
            case NSCurveToBezierPathElement:
                CGPathAddCurveToPoint(path, NULL, p[0].x, p[0].y, p[1].x, p[1].y, p[2].x, p[2].y);
                closed = NO;
                break;
                
            case NSClosePathBezierPathElement:
                CGPathCloseSubpath(path);
                closed = YES;
                break;
        }
    }
    
    if (!closed)  CGPathCloseSubpath(path);
    
    CGPathRef immutablePath = CGPathCreateCopy(path);
    objc_setAssociatedObject(self, key, (__bridge id)immutablePath, OBJC_ASSOCIATION_RETAIN);
    CGPathRelease(immutablePath);
    
    CGPathRelease(path);
    
    return (__bridge CGPathRef)objc_getAssociatedObject(self, key);
}


@end
