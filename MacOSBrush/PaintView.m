//
//  PaintView.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 20.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "PaintView.h"
#import "PaintProtocol.h"

@interface PaintView ()

@end

@implementation PaintView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
}

- (NSPoint)convertPointToImageCoordinate:(NSPoint)point {
    
    CGFloat frameWidth = self.frame.size.width;
    CGFloat frameHeight = self.frame.size.height;
    
    CGFloat imageWidth = self.image.size.width;
    CGFloat imageHeight = self.image.size.height;
    
    return NSMakePoint(point.x - (frameWidth - imageWidth)/2, point.y - (frameHeight - imageHeight)/2);
}

- (void)mouseDown:(NSEvent *)theEvent {
    
    NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
    [self.delegate drawingDidBeginAtPoint:[self convertPointToImageCoordinate:point] inView:self];
}

- (void)mouseDragged:(NSEvent *)theEvent {
    
    NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
    [self.delegate drawingMovedToPoint:[self convertPointToImageCoordinate:point] inView:self];
}

- (void)mouseUp:(NSEvent *)theEvent {
    
    NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
    [self.delegate drawingDidEndAtPoint:[self convertPointToImageCoordinate:point] inView:self];
}

@end
