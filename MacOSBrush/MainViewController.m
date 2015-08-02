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
#import "BombTool.h"

@interface MainViewController ()

@property (weak) IBOutlet NSScrollView *paintScrollView;

@property (strong, nonatomic) BrushTool *brushTool;
@property (strong, nonatomic) EraserTool *eraserTool;
@property (strong, nonatomic) BombTool *bombTool;

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
    //self.paintScrollView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)setLineWidth:(NSInteger)lineWidth {
    
    _lineWidth = lineWidth;
    
    self.brushTool.lineWidth = lineWidth;
    self.brushTool.lineColor = [NSColor blackColor];
    
    self.eraserTool.lineWidth = lineWidth;
    
    self.bombTool.color = [NSColor greenColor];
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

- (BombTool *)bombTool {
    
    if (_bombTool == nil) {
        
        _bombTool = [BombTool new];
    }
    return _bombTool;
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
    
    
    [self.paintScrollView setDocumentCursor:self.bombTool.cursor];
    
    PaintView *paintView = self.paintScrollView.contentView.documentView;
    paintView.delegate = self.bombTool;
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
