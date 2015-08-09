//
//  EraserTool.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 21.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "EraserTool.h"
#import <AppKit/NSGraphicsContext.h>
#import <AppKit/NSImage.h>
#import <AppKit/NSImageView.h>
#import <AppKit/NSBezierPath.h>
#import <AppKit/NSColor.h>
#import <AppKit/NSCursor.h>

@interface EraserTool ()

@property (strong, nonatomic) NSBezierPath *bezierPath;

@end

@implementation EraserTool

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.cursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"eraser-cursor"] hotSpot:NSMakePoint(2, 13)];
    }
    return self;
}

- (void)drawingDidBeginAtPoint:(NSPoint)point inView:(NSImageView*)paintView {
    
    self.bezierPath = [NSBezierPath bezierPath];
    self.bezierPath.lineWidth = self.lineWidth;
    [self.bezierPath moveToPoint:point];
}

- (void)drawingMovedToPoint:(NSPoint)point inView:(NSImageView*)paintView {
    
    [paintView.image lockFocus];
    
    [[NSGraphicsContext currentContext] setShouldAntialias:NO];
    [NSGraphicsContext saveGraphicsState];
    [[NSGraphicsContext currentContext] setCompositingOperation:NSCompositeCopy];
    
    [[NSColor whiteColor] setStroke];
    
    [self.bezierPath lineToPoint:point];
    [self.bezierPath stroke];
    
    [NSGraphicsContext restoreGraphicsState];
    
    [paintView.image unlockFocus];
    [paintView setNeedsDisplay];
}

- (void)drawingDidEndAtPoint:(NSPoint)point inView:(NSImageView*)paintView {
    
    self.bezierPath = nil;
}

@end
