//
//  PaintView.h
//  MacOSBrush
//
//  Created by neo on 19.10.15.
//  Copyright © 2015 NSSimpleApps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PaintView : NSImageView

@property (assign, nonatomic) NSInteger lineWidth;

@property (strong, nonatomic) NSColor *color;

+ (NSCursor *)cursor;

@end
