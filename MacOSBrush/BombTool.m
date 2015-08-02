//
//  BombTool.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 21.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "BombTool.h"
#import <AppKit/NSImageView.h>
#import <AppKit/NSColor.h>
#import <AppKit/NSCursor.h>
#import <AppKit/NSImage.h>
//#import <AppKit/NSBezierPath.h>
#import <QuartzCore/CAShapeLayer.h>
#import <QuartzCore/CAAnimation.h>
#import <QuartzCore/CAMediaTimingFunction.h>
#import "NSBezierPath+CGPath.h"


@interface BombTool ()

@property (weak, nonatomic) NSImageView *imageView;

@end

@implementation BombTool

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.cursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"bomb-cursor"] hotSpot:NSMakePoint(8, 8)];
        
        self.color = [NSColor whiteColor];
    }
    return self;
}

- (void)drawingDidBeginAtPoint:(NSPoint)point inView:(NSImageView*)paintView {
    
    self.imageView = paintView;
    
    CAShapeLayer *circularLayer = [CAShapeLayer layer];
    circularLayer.path = [self circularPathWithCenter:point radius:0];
    circularLayer.fillColor = [self.color CGColor];
    
    [paintView.layer addSublayer:circularLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.values = @[(id)[self circularPathWithCenter:point radius:0],
                         (id)[self circularPathWithCenter:point radius:[self maximumRadius:point rect:paintView.frame]]];
    animation.duration = 0.4;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    [animation setValue:circularLayer forKey:@"circularLayer"];
    
    [circularLayer addAnimation:animation forKey:@"expanding"];
}

- (CGPathRef)circularPathWithCenter:(NSPoint)center radius:(CGFloat)radius {
    
    
    NSBezierPath *circularPath = [NSBezierPath bezierPathWithOvalInRect:NSMakeRect(center.x - radius, center.y - radius, 2*radius, 2*radius)];
    
    return [circularPath CGPath];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    CAShapeLayer *circularLayer = [anim valueForKey:@"circularLayer"];
    [circularLayer removeFromSuperlayer];
    
    [self.imageView.image lockFocus];
    [self.color setFill];
    NSRectFill(NSMakeRect(0, 0, self.imageView.image.size.width, self.imageView.image.size.height));
    [self.imageView.image unlockFocus];
    
    [self.imageView setNeedsDisplay];
}

- (CGFloat)maximumRadius:(CGPoint)touchLocation rect:(NSRect)rect {
    
    CGFloat width = rect.size.width, height = rect.size.height;
    
    CGFloat x = touchLocation.x, y = touchLocation.y;
    
    CGFloat R1 = hypotf(x, y);
    CGFloat R2 = hypotf(x - width, y);
    CGFloat R3 = hypotf(x, y - height);
    CGFloat R4 = hypotf(x - width, y - height);
    
    return MAX(MAX(R1, R2), MAX(R3, R4));
}

/*- (void)drawingMovedToPoint:(NSPoint)point inView:(NSImageView*)paintView {
    
    
}

- (void)drawingDidEndAtPoint:(NSPoint)point inView:(NSImageView*)paintView {
    
    
}*/

@end
