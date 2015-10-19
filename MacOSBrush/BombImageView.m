//
//  BombImageView.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 21.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "BombImageView.h"
#import "NSBezierPath+CGPath.h"
#import <QuartzCore/CAShapeLayer.h>
#import <QuartzCore/CAAnimation.h>
#import <QuartzCore/CAMediaTimingFunction.h>

@interface BombImageView ()

@end

@implementation BombImageView

+ (NSCursor *)cursor {
    
    return [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"bomb-cursor"] hotSpot:NSMakePoint(8, 8)];
}

- (void)mouseDown:(NSEvent *)theEvent {
    
    NSPoint locationInWindow = theEvent.locationInWindow;
    NSPoint point = [self convertPoint:locationInWindow fromView:nil];
    
    CAShapeLayer *circularLayer = [CAShapeLayer layer];
    circularLayer.path = [self circularPathWithCenter:point radius:0];
    circularLayer.fillColor = [self.color CGColor];
    
    [self.layer addSublayer:circularLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.values = @[(id)[self circularPathWithCenter:point radius:0],
                         (id)[self circularPathWithCenter:point radius:[self maximumRadius:point rect:self.frame]]];
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
    
    [self.image lockFocus];
    [self.color setFill];
    NSRectFill(NSMakeRect(0, 0, self.image.size.width, self.image.size.height));
    [self.image unlockFocus];
    
    [self setNeedsDisplay:YES];
}

- (CGFloat)maximumRadius:(NSPoint)touchLocation rect:(NSRect)rect {
    
    CGFloat width = rect.size.width, height = rect.size.height;
    
    CGFloat x = touchLocation.x, y = touchLocation.y;
    
    CGFloat R1 = hypotf(x, y);
    CGFloat R2 = hypotf(x - width, y);
    CGFloat R3 = hypotf(x, y - height);
    CGFloat R4 = hypotf(x - width, y - height);
    
    return MAX(MAX(R1, R2), MAX(R3, R4));
}

@end
