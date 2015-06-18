//
//  MainViewController.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 17.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak) IBOutlet NSScrollView *paintScrollView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSRect frameRect = NSMakeRect(0, 0, 640, 480);//self.paintScrollView.contentView.frame;
    NSImage *image = [[NSImage alloc] initWithSize:frameRect.size];
    
    [image lockFocus];
    [[NSColor whiteColor] setFill];
    NSRectFill(frameRect);
    [image unlockFocus];
    
    NSRect imageRect = NSMakeRect(0, 0, image.size.width, image.size.height);
    
    NSImageView *imageView = [[NSImageView alloc] initWithFrame:imageRect];
    imageView.bounds = imageRect;
    imageView.image = image;
    
    self.paintScrollView.documentView = imageView;
    
    self.paintScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSView *documentSuperview = [self.paintScrollView.documentView superview];
    [(NSView*)self.paintScrollView.documentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [documentSuperview addConstraint:[NSLayoutConstraint constraintWithItem:documentSuperview
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.paintScrollView.documentView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1
                                                                   constant:0]];
    
    [documentSuperview addConstraint:[NSLayoutConstraint constraintWithItem:documentSuperview
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.paintScrollView.documentView
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1
                                                                   constant:0]];
    
    NSImageView *documentView = (NSImageView*)self.paintScrollView.documentView;
    
    [documentSuperview addConstraint:[NSLayoutConstraint constraintWithItem:documentView
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                     toItem:self.paintScrollView.contentView
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1
                                                                   constant:0]];
    
    [documentSuperview addConstraint:[NSLayoutConstraint constraintWithItem:documentView
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                     toItem:self.paintScrollView.contentView
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:1
                                                                   constant:0]];

    
    
}

- (IBAction)setBrushMode:(NSMatrix *)sender {
    
    //NSCursor *c = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"brush"] hotSpot:NSMakePoint(5, 5)];
    
    //[[self.view enclosingScrollView] setDocumentCursor:c];
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

@end
