//
//  CustomClipView.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 05.07.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "CustomClipView.h"

@implementation CustomClipView

- (instancetype)initWithFrame:(NSRect)frameRect {
    
    self = [super initWithFrame:frameRect];
    
    if (self) {
        
        self.drawsBackground = NO;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    
    if (self) {
        
        self.drawsBackground = NO;
    }
    return self;
}

- (NSRect)constrainBoundsRect:(NSRect)proposedClipViewBoundsRect {
    
    NSRect rect = [super constrainBoundsRect:proposedClipViewBoundsRect];
    
    NSView *containerView = self.documentView;
        
    if (rect.size.width > containerView.frame.size.width) {
        
        rect.origin.x = (containerView.frame.size.width - rect.size.width) / 2;
    }
        
    if(rect.size.height > containerView.frame.size.height) {
        rect.origin.y = (containerView.frame.size.height - rect.size.height) / 2;
    }
    return rect;
}

@end
