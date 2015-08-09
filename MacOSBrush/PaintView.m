//
//  PaintView.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 20.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "PaintView.h"
#import "PaintProtocol.h"

@implementation PaintView


- (NSPoint)convertPointToImageCoordinate:(NSPoint)point {
    
    CGFloat frameWidth = self.frame.size.width;
    CGFloat frameHeight = self.frame.size.height;
    
    CGFloat imageWidth = self.image.size.width;
    CGFloat imageHeight = self.image.size.height;
    
    return NSMakePoint(point.x - (frameWidth - imageWidth)/2, point.y - (frameHeight - imageHeight)/2);
}

- (void)mouseDown:(NSEvent *)theEvent {
    
    if ([self.delegate respondsToSelector:@selector(drawingDidBeginAtPoint:inView:)]) {
        
        NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
        
        [self.delegate drawingDidBeginAtPoint:[self convertPointToImageCoordinate:point] inView:self];
    }
}

- (void)mouseDragged:(NSEvent *)theEvent {
    
    if ([self.delegate respondsToSelector:@selector(drawingMovedToPoint:inView:)]) {
    
        NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
        [self.delegate drawingMovedToPoint:[self convertPointToImageCoordinate:point] inView:self];
    }
}

- (void)mouseUp:(NSEvent *)theEvent {
    
    if ([self.delegate respondsToSelector:@selector(drawingDidEndAtPoint:inView:)]) {
    
        NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
        [self.delegate drawingDidEndAtPoint:[self convertPointToImageCoordinate:point] inView:self];
    }
}

/*- (void)updateTrackingAreas {
    
    if (self.trackingAreas.count == 0) {
        
        NSUInteger opts = (NSTrackingMouseEnteredAndExited | NSTrackingActiveInKeyWindow | NSTrackingEnabledDuringMouseDrag);
        
        NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                                    options:opts
                                                                      owner:self
                                                                   userInfo:nil];
        [self addTrackingArea:trackingArea];
    }
}*/

@end
