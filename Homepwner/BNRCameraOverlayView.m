//
//  BNRCameraOverlayView.m
//  Homepwner
//
//  Created by Jan Graßegger on 01.05.14.
//  Copyright (c) 2014 Jan Graßegger. All rights reserved.
//

#import "BNRCameraOverlayView.h"

@implementation BNRCameraOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    float width = bounds.size.width;
    float height = bounds.size.height;
    
    float crosshairWidth = width/5;
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    
    
    [bezierPath moveToPoint: CGPointMake(width / 2 - crosshairWidth / 2, height / 2)];
    [bezierPath addLineToPoint:CGPointMake(width / 2 + crosshairWidth / 2, height / 2)];
    [bezierPath moveToPoint:CGPointMake(width / 2, height / 2 - crosshairWidth / 2)];
    [bezierPath addLineToPoint:CGPointMake(width / 2, height / 2 + crosshairWidth / 2)];
    
    //Configure line width to 10 pixels
    bezierPath.lineWidth = 2;
    
    //Configure the drawing color to light gray
    [[UIColor redColor] setStroke];
    //[self.circleColor
    
    //Draw the line
    [bezierPath stroke];
    
    [self setNeedsDisplay];

    
    
}


@end
