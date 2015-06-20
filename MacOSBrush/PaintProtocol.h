//
//  PaintProtocol.h
//  MacOSBrush
//
//  Created by NSSimpleApps on 20.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaintProtocol <NSObject>

@optional

- (void)drawingDidBeginAtPoint:(NSPoint)point inView:(PaintView*)paintView;

- (void)drawingMovedToPoint:(NSPoint)point inView:(PaintView*)paintView;

- (void)drawingDidEndAtPoint:(NSPoint)point inView:(PaintView*)paintView;

@end
