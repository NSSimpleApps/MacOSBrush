//
//  LineTool.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 21.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "LineTool.h"

@interface LineTool ()

@property (assign, nonatomic) NSPoint p0;

@property (strong, nonatomic) NSBezierPath *bezierPath;

@end

@implementation LineTool

+ (NSCursor *)cursor {
    
    return [NSCursor crosshairCursor];
}

- (NSBezierPath *)bezierPathFromPoint:(NSPoint)p0 toPoint:(NSPoint)p1 {
    
    NSBezierPath *bezierPath = [NSBezierPath new];
    bezierPath.lineWidth = self.lineWidth;
    [bezierPath moveToPoint:p0];
    [bezierPath lineToPoint:p1];
    
    return bezierPath;
}

- (void)drawingDidBeginAtPoint:(NSPoint)point inView:(NSImageView*)paintView {
    
    self.p0 = point;
    
    self.bezierPath = [NSBezierPath new];
    self.bezierPath.lineWidth = self.lineWidth;
    
}

- (void)drawingMovedToPoint:(NSPoint)point inView:(NSImageView*)paintView {
    
    [paintView.image lockFocus];
    
    [[NSGraphicsContext currentContext] setShouldAntialias:NO];
    [NSGraphicsContext saveGraphicsState];
    [[NSGraphicsContext currentContext] setCompositingOperation:NSCompositeCopy];
    
    [self.color setStroke];
    
    NSBezierPath *bezierPath = [self bezierPathFromPoint:self.p0 toPoint:point];
    
    [bezierPath stroke];
    
    [NSGraphicsContext restoreGraphicsState];
    
    [paintView.image unlockFocus];
    [paintView setNeedsDisplay];
}

- (void)drawingDidEndAtPoint:(NSPoint)point inView:(NSImageView*)paintView {
    
    self.bezierPath = nil;
}

@end
