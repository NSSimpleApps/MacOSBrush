//
//  PaintProtocol.h
//  MacOSBrush
//
//  Created by NSSimpleApps on 20.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSImageView;

@protocol PaintProtocol <NSObject>

@optional

- (void)drawingDidBeginAtPoint:(NSPoint)point inView:(NSImageView*)paintView;

- (void)drawingMovedToPoint:(NSPoint)point inView:(NSImageView*)paintView;

- (void)drawingDidEndAtPoint:(NSPoint)point inView:(NSImageView*)paintView;

@end
