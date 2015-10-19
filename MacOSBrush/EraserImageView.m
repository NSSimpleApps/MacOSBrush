//
//  EraserImageView.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 21.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "EraserImageView.h"

@interface EraserImageView ()

@property (strong, nonatomic) NSBezierPath *bezierPath;

@end

@implementation EraserImageView

+ (NSCursor *)cursor {
    
    return [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"eraser-cursor"] hotSpot:NSMakePoint(2, 13)];
}

- (void)mouseDown:(NSEvent *)theEvent {
    
    self.bezierPath = [NSBezierPath bezierPath];
    self.bezierPath.lineWidth = self.lineWidth;
    
    NSPoint locationInWindow = theEvent.locationInWindow;
    NSPoint point = [self convertPoint:locationInWindow fromView:nil];
    
    [self.bezierPath moveToPoint:point];
}

- (void)mouseDragged:(NSEvent *)theEvent {
    
    NSPoint locationInWindow = theEvent.locationInWindow;
    NSPoint point = [self convertPoint:locationInWindow fromView:nil];
    
    [self.image lockFocus];
    
    [[NSGraphicsContext currentContext] setShouldAntialias:NO];
    [NSGraphicsContext saveGraphicsState];
    [[NSGraphicsContext currentContext] setCompositingOperation:NSCompositeCopy];
    
    [[NSColor whiteColor] setStroke];
    
    [self.bezierPath lineToPoint:point];
    [self.bezierPath stroke];
    
    [NSGraphicsContext restoreGraphicsState];
    
    [self.image unlockFocus];
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)theEvent {
    
    self.bezierPath = nil;
}

@end
