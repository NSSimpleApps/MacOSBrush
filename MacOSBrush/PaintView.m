//
//  PaintView.m
//  MacOSBrush
//
//  Created by neo on 18.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "PaintView.h"

@implementation PaintView


- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    
    if (self) {
        
        //NSLog(@"%@", NSStringFromRect(v.bounds));
        
        
        NSView *v = self.documentView;
        
        v.frame = NSMakeRect(20, 20, 200, 200);
        v.wantsLayer = YES;
        v.layer.backgroundColor = [NSColor greenColor].CGColor;
        
        NSLog(@"%@", NSStringFromRect(v.bounds));
        
        
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    
    self = [super initWithFrame:frameRect];
    
    if (self) {
        
        /*self.frame = NSMakeRect(10, 10, 200, 200);
        self.wantsLayer = YES;
        self.layer.backgroundColor = [NSColor greenColor].CGColor;*/
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
