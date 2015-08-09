//
//  LineTool.h
//  MacOSBrush
//
//  Created by NSSimpleApps on 21.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaintProtocol.h"

@class NSColor, NSCursor;

@interface LineTool : NSObject <PaintProtocol>

@property (strong, nonatomic) NSColor *color;

@property (strong, nonatomic) NSCursor *cursor;

@property (assign, nonatomic) NSInteger lineWidth;

@end
