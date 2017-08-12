//
//  MGSKosmicUnityTabStyle.m
//  KosmicTask
//
//  Created by Jonathan on 29/11/2012.
//
//

#import "MGSKosmicUnityTabStyle.h"
#import "PSMTabBarControl/PSMTabBarCell.h"
#import "PSMTabBarControl/PSMTabBarControl.h"

@implementation MGSKosmicUnityTabStyle

+ (NSString *)name {
    return @"KosmicUnity";
}

- (NSString *)name {
	return [[self class] name];
}

#pragma mark -
#pragma mark Drawing

-(void)drawBezelOfTabCell:(PSMTabBarCell *)cell withFrame:(NSRect)frame inTabBarControl:(PSMTabBarControl *)tabBarControl
{   
	NSBezierPath *bezier = [NSBezierPath bezierPath];
	NSColor *lineColor = [NSColor colorWithCalibratedWhite:0.500 alpha:1.0];
    
    NSRect aRect = NSMakeRect(frame.origin.x + 0.5, frame.origin.y - 0.5, frame.size.width, frame.size.height);
    
    if ([cell isHighlighted] && [cell state] == NSOffState)
    {
        aRect.origin.y += 1.5;
        aRect.size.height -= 1.5;
    }
    
    CGFloat radius = MIN(6.0, 0.5f * MIN(NSWidth(aRect), NSHeight(aRect)));
    NSRect rect = NSInsetRect(aRect, radius, radius);
    
    NSPoint cornerPoint = NSMakePoint(NSMaxX(aRect), NSMinY(aRect));
    [bezier appendBezierPathWithPoints:&cornerPoint count:1];
    
    [bezier appendBezierPathWithArcWithCenter:NSMakePoint(NSMaxX(rect), NSMaxY(rect)) radius:radius startAngle:0.0 endAngle:90.0];
    
    [bezier appendBezierPathWithArcWithCenter:NSMakePoint(NSMinX(rect), NSMaxY(rect)) radius:radius startAngle:90.0 endAngle:180.0];
    
    cornerPoint = NSMakePoint(NSMinX(aRect), NSMinY(aRect));
    [bezier appendBezierPathWithPoints:&cornerPoint count:1];
    
    if ([tabBarControl isWindowActive]) {
        if ([cell state] == NSOnState) {
            NSColor *startColor = [NSColor colorWithCalibratedRed:0.875f green:0.875f blue:0.875f alpha:1.0f];
            NSColor *endColor = [NSColor colorWithCalibratedRed:0.825f green:0.825f blue:0.825f alpha:1.0f];
            NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:startColor endingColor:endColor];
            [gradient drawInBezierPath:bezier angle:90.0];
        } else if ([cell isHighlighted]) {
            NSColor *startColor = [NSColor colorWithDeviceWhite:0.650 alpha:1.000];
            NSColor *endColor = [NSColor colorWithDeviceWhite:0.650 alpha:1.000];
            NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:startColor endingColor:endColor];
            [gradient drawInBezierPath:bezier angle:90.0];
        }
        
    } else {
        if ([cell state] == NSOnState) {
            NSColor *startColor = [NSColor colorWithCalibratedRed:0.875f green:0.875f blue:0.875f alpha:1.0f];
            NSColor *endColor = [NSColor colorWithCalibratedRed:0.825f green:0.825f blue:0.825f alpha:1.0f];
            NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:startColor endingColor:endColor];
            [[NSGraphicsContext currentContext] setShouldAntialias:NO];
            [gradient drawInBezierPath:bezier angle:90.0];
            [[NSGraphicsContext currentContext] setShouldAntialias:YES];
        }
    }
    
    [lineColor set];
    [bezier stroke];
}

- (void)drawBezelOfTabBarControl:(PSMTabBarControl *)tabBarControl inRect:(NSRect)rect {
	//Draw for our whole bounds; it'll be automatically clipped to fit the appropriate drawing area
	rect = [tabBarControl bounds];
    
	NSRect gradientRect = rect;
	gradientRect.size.height -= 0.0;

    NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedWhite:0.760 alpha:1.0] endingColor:[NSColor colorWithCalibratedWhite:0.660 alpha:1.0]];
    [gradient drawInRect:gradientRect angle:90.0];

    
	[[NSColor colorWithCalibratedWhite:0.500 alpha:1.0] set];
	[NSBezierPath strokeLineFromPoint:NSMakePoint(rect.origin.x, NSMinY(rect) + 0.5)
                              toPoint:NSMakePoint(NSMaxX(rect), NSMinY(rect) + 0.5)];
    
	[NSBezierPath strokeLineFromPoint:NSMakePoint(rect.origin.x, NSMaxY(rect) - 0.5)
                              toPoint:NSMakePoint(NSMaxX(rect), NSMaxY(rect) - 0.5)];
}

@end
