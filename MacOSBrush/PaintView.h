//
//  PaintView.h
//  MacOSBrush
//
//  Created by NSSimpleApps on 20.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol PaintProtocol;

@interface PaintView : NSImageView

@property (nonatomic, weak) id<PaintProtocol> delegate;

@end
