//
//  MainViewController.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 17.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "MainViewController.h"
#import "PaintView.h"
#import "BrushTool.h"
#import "EraserTool.h"

@interface MainViewController ()

@property (weak) IBOutlet NSScrollView *paintScrollView;

@property (strong, nonatomic) BrushTool *brushTool;
@property (strong, nonatomic) EraserTool *eraserTool;

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.lineWidth = 2;
    
    NSRect frameRect = NSMakeRect(0, 0, 640, 480);
    NSImage *image = [[NSImage alloc] initWithSize:frameRect.size];
    
    [image lockFocus];
    [[NSColor whiteColor] setFill];
    NSRectFill(frameRect);
    [image unlockFocus];
    
    NSRect imageRect = NSMakeRect(0, 0, image.size.width, image.size.height);
    
    PaintView *paintView = [[PaintView alloc] initWithFrame:imageRect];
    //paintView.bounds = imageRect;
    paintView.image = image;
    
    self.paintScrollView.documentView = paintView;
    self.paintScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSView *clipView = [self.paintScrollView.documentView superview];
    
    [(PaintView*)self.paintScrollView.documentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [clipView addConstraint:[NSLayoutConstraint constraintWithItem:clipView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.paintScrollView.documentView
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1
                                                          constant:0]];
    
    [clipView addConstraint:[NSLayoutConstraint constraintWithItem:clipView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.paintScrollView.documentView
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
    
    [clipView addConstraint:[NSLayoutConstraint constraintWithItem:paintView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                            toItem:self.paintScrollView.contentView
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1
                                                          constant:0]];
    
    [clipView addConstraint:[NSLayoutConstraint constraintWithItem:paintView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                            toItem:self.paintScrollView.contentView
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1
                                                          constant:0]];
}

- (void)setLineWidth:(NSInteger)lineWidth {
    
    _lineWidth = lineWidth;
    
    self.brushTool.lineWidth = lineWidth;
    self.brushTool.lineColor = [NSColor blackColor];
    
    self.eraserTool.lineWidth = lineWidth;
}

- (BrushTool *)brushTool {
    
    if (_brushTool == nil) {
        
        _brushTool = [BrushTool new];
    }
    return _brushTool;
}

- (EraserTool *)eraserTool {
    
    if (_eraserTool == nil) {
        
        _eraserTool = [EraserTool new];
    }
    return _eraserTool;
}

- (IBAction)setBrushMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:self.brushTool.cursor];
    
    PaintView *paintView = self.paintScrollView.contentView.documentView;
    paintView.delegate = self.brushTool;
}

- (IBAction)setSelectionMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor crosshairCursor]];
}

- (IBAction)setFillMode:(NSMatrix *)sender {
    
    NSCursor *bucketCursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"bucket-cursor"] hotSpot:NSZeroPoint];
    
    [self.paintScrollView setDocumentCursor:bucketCursor];
}

- (IBAction)setLineMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor crosshairCursor]];
}

- (IBAction)setRectangleMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor crosshairCursor]];
}

- (IBAction)setRoundedRectangleMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor crosshairCursor]];
}

- (IBAction)setEyedropperMode:(NSMatrix *)sender {
    
    NSCursor *eyedropCursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"eyedrop-cursor"] hotSpot:NSZeroPoint];
    
    [self.paintScrollView setDocumentCursor:eyedropCursor];
}

- (IBAction)setEraserMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:self.eraserTool.cursor];
    
    PaintView *paintView = self.paintScrollView.contentView.documentView;
    paintView.delegate = self.eraserTool;
}

- (IBAction)setAirbrushMode:(NSMatrix *)sender {
    
    NSCursor *airbrushCursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"airbrush-cursor"] hotSpot:NSZeroPoint];
    
    [self.paintScrollView setDocumentCursor:airbrushCursor];
}

- (IBAction)setBombMode:(NSMatrix *)sender {
    
    NSCursor *bombCursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"bomb-cursor"] hotSpot:NSZeroPoint];
    
    [self.paintScrollView setDocumentCursor:bombCursor];
}

- (IBAction)setCurveMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor crosshairCursor]];
}

- (IBAction)setEllipseMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor crosshairCursor]];
}

- (IBAction)setTextMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor IBeamCursor]];
}

- (IBAction)setZoomMode:(NSMatrix *)sender {
    
    NSCursor *zoomCursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"zoom-cursor"] hotSpot:NSZeroPoint];
    
    [self.paintScrollView setDocumentCursor:zoomCursor];
}

@end
