//
//  CXDitheredGradientView.m
//  CALX
//
//  Created by Daniel Clelland on 3/04/15.
//  Copyright (c) 2015 Daniel Clelland. All rights reserved.
//

#import "CXDitheredGradientView.h"

@interface CXDitheredGradientView ()

- (void)drawGradient:(CGGradientRef)gradient inContext:(CGContextRef)context inRect:(CGRect)rect;

- (CGGradientRef)gradientWithColors:(NSArray *)colors;

@end

@implementation CXDitheredGradientView

- (void)setColors:(NSArray *)colors
{
    _colors = colors;
    
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGGradientRef gradient = [self gradientWithColors:self.colors ?: @[[UIColor clearColor], [UIColor clearColor]]];
    
    [self drawGradient:gradient inContext:context inRect:rect];
    
    CGGradientRelease(gradient);
}

- (void)drawGradient:(CGGradientRef)gradient inContext:(CGContextRef)context inRect:(CGRect)rect
{
    CGPoint top = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint bottom = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextDrawLinearGradient(context, gradient, top, bottom, 0);
}

#pragma mark - Private

- (CGGradientRef)gradientWithColors:(NSArray *)colors
{
    NSMutableArray *gradientColors = [[NSMutableArray alloc] init];
    
    for (UIColor *color in colors) {
        [gradientColors addObject:(id)color.CGColor];
    }
    
    return CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), (CFArrayRef)gradientColors, NULL);
}

@end
