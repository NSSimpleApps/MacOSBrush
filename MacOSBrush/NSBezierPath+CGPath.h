//
//  NSBezierPath+CGPath.h
//  MacOSBrush
//
//  Created by neo on 05.07.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// borrowed from here https://github.com/iccir/XUIKit

@interface NSBezierPath (CGPath)

- (CGPathRef)CGPath NS_RETURNS_INNER_POINTER;

@end
