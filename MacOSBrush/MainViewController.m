//
//  MainViewController.m
//  MacOSBrush
//
//  Created by NSSimpleApps on 17.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "MainViewController.h"
#import "PaintView.h"
#import "BrushImageView.h"
#import "EraserImageView.h"
#import "BombImageView.h"
#import "LineTool.h"
#import "EllipseTool.h"
#import <objc/runtime.h>

@interface MainViewController ()

@property (weak) IBOutlet NSScrollView *paintScrollView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.lineWidth = 2;
    self.color = [NSColor colorWithRed:15.f/255 green:14.f/255 blue:1 alpha:1];
    
    NSRect frameRect = NSMakeRect(0, 0, 640, 480);
    NSImage *image = [[NSImage alloc] initWithSize:frameRect.size];
    
    [image lockFocus];
    [[NSColor whiteColor] setFill];
    NSRectFill(frameRect);
    [image unlockFocus];
    
    NSRect imageRect = NSMakeRect(0, 0, image.size.width, image.size.height);
    
    PaintView *paintView = [[PaintView alloc] initWithFrame:imageRect];
    paintView.image = image;
    
    self.paintScrollView.documentView = paintView;
    //self.paintScrollView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)setLineWidth:(NSInteger)lineWidth {
    
    _lineWidth = lineWidth;
    
    if ([self.paintScrollView.contentView.documentView respondsToSelector:@selector(lineWidth)]) {
        
        [self.paintScrollView.contentView.documentView setValue:@(lineWidth) forKey:@"lineWidth"];
    }
}

- (void)setColor:(NSColor *)color {
    
    _color = color;
    
    if ([self.paintScrollView.contentView.documentView respondsToSelector:@selector(color)]) {
        
        [self.paintScrollView.contentView.documentView setValue:color forKey:@"color"];
    }
}

- (IBAction)setBrushMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[BrushImageView cursor]];
    
    object_setClass(self.paintScrollView.contentView.documentView, [BrushImageView class]);
    
    BrushImageView *brushImageView = self.paintScrollView.contentView.documentView;
    brushImageView.color = self.color;
    brushImageView.lineWidth = self.lineWidth;
}

- (IBAction)setSelectionMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor crosshairCursor]];
}

- (IBAction)setFillMode:(NSMatrix *)sender {
    
    NSCursor *bucketCursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"bucket-cursor"] hotSpot:NSZeroPoint];
    
    [self.paintScrollView setDocumentCursor:bucketCursor];
}

- (IBAction)setLineMode:(NSMatrix *)sender {
    
    /*[self.paintScrollView setDocumentCursor:self.lineTool.cursor];
    
    PaintView *paintView = self.paintScrollView.contentView.documentView;
    paintView.delegate = self.lineTool;*/
}

- (IBAction)setRectangleMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor crosshairCursor]];
}

- (IBAction)setRoundedRectangleMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[NSCursor crosshairCursor]];
}

- (IBAction)setEyedropperMode:(NSMatrix *)sender {
    
    /*NSCursor *eyedropCursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"eyedrop-cursor"] hotSpot:NSZeroPoint];
    
    [self.paintScrollView setDocumentCursor:eyedropCursor];*/
}

- (IBAction)setEraserMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[EraserImageView cursor]];
    
    object_setClass(self.paintScrollView.contentView.documentView, [EraserImageView class]);
    
    EraserImageView *eraserImageView = self.paintScrollView.contentView.documentView;
    eraserImageView.lineWidth = self.lineWidth;
}

- (IBAction)setAirbrushMode:(NSMatrix *)sender {
    
    NSCursor *airbrushCursor = [[NSCursor alloc] initWithImage:[NSImage imageNamed:@"airbrush-cursor"] hotSpot:NSZeroPoint];
    
    [self.paintScrollView setDocumentCursor:airbrushCursor];
}

- (IBAction)setBombMode:(NSMatrix *)sender {
    
    [self.paintScrollView setDocumentCursor:[BombImageView cursor]];
    
    object_setClass(self.paintScrollView.contentView.documentView, [BombImageView class]);
    
    //BombImageView *bombImageView = self.paintScrollView.contentView.documentView;
    //bombImageView.color = self.color;
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
