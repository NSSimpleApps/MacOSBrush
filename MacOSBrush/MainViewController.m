//
//  MainViewController.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 17.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSView *v = [[NSView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    v.wantsLayer = YES;
    v.layer.backgroundColor = [NSColor greenColor].CGColor;
    [self.view addSubview:v];
}

- (IBAction)setBrushMode:(NSMatrix *)sender {
    
    NSCursor *c = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"brush"] hotSpot:NSMakePoint(5, 5)];
    
    [c push];
}
- (IBAction)setSelectionMode:(NSMatrix *)sender {
}
- (IBAction)setFillMode:(NSMatrix *)sender {
}
- (IBAction)setLineMode:(NSMatrix *)sender {
}
- (IBAction)setRectangleMode:(NSMatrix *)sender {
}
- (IBAction)setRoundedRectangleMode:(NSMatrix *)sender {
}
- (IBAction)setEyedropperMode:(NSMatrix *)sender {
}
- (IBAction)setEraserMode:(NSMatrix *)sender {
}
- (IBAction)setAirbrushMode:(NSMatrix *)sender {
}
- (IBAction)setBombMode:(NSMatrix *)sender {
}
- (IBAction)setCurveMode:(NSMatrix *)sender {
}
- (IBAction)setEllipseMode:(NSMatrix *)sender {
}
- (IBAction)setTextMode:(NSMatrix *)sender {
}
- (IBAction)setZoomMode:(NSMatrix *)sender {
}

- (void)mouseDown:(NSEvent *)theEvent {
    
    NSLog(@"%s", __func__);
    
    [[NSCursor currentCursor] pop];
}

@end
