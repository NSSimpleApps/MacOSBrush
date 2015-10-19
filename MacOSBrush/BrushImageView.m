//
//  BrushImageView.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 21.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "BrushImageView.h"

@interface BrushImageView ()

@property (strong, nonatomic) NSBezierPath *bezierPath;

@end

@implementation BrushImageView

+ (NSCursor *)cursor {
    
    return [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"brush-cursor"] hotSpot:NSMakePoint(1, 14)];
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
    
    [self.color setStroke];
    
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
