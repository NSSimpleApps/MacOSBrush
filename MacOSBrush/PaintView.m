//
//  PaintView.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 20.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "PaintView.h"

@interface PaintView ()

@property (strong, nonatomic) NSBezierPath *bezierPath;

@property (assign, nonatomic) NSPoint savedPoint;

@end

@implementation PaintView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
}

- (void)mouseDown:(NSEvent *)theEvent {
    
    self.savedPoint = [self convertPoint:[theEvent locationInWindow] fromView:nil];
}

- (void)mouseDragged:(NSEvent *)theEvent {
    
    NSLog(@"%s", __func__);
    NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
    [self.image lockFocus];
    
    [[NSGraphicsContext currentContext] setShouldAntialias:NO];
    
    [NSGraphicsContext saveGraphicsState];
    [[NSGraphicsContext currentContext] setCompositingOperation:NSCompositeCopy];
    
    [[NSColor blackColor] setStroke];
    
    [[self pathFromPoint:self.savedPoint toPoint:point] stroke];
    [NSGraphicsContext restoreGraphicsState];
    
    self.savedPoint = point;
    
    [self setNeedsDisplay];
    
    [self.image unlockFocus];
    
    
}


- (NSBezierPath *)pathFromPoint:(NSPoint)begin toPoint:(NSPoint)end
{
    if (!self.bezierPath) {
        self.bezierPath = [NSBezierPath bezierPathWithRect:self.frame];
        [self.bezierPath setLineWidth:2];
    }
    
    [self.bezierPath moveToPoint:begin];
    [self.bezierPath lineToPoint:end];
    
    return self.bezierPath;
}

@end
