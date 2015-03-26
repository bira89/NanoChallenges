//
//  ElementsView.m
//  Jogo da Velha
//
//  Created by Bira on 24/03/15.
//  Copyright (c) 2015 Senac. All rights reserved.
//

#import "ElementsView.h"

@interface ElementsView ()

@property (strong, nonatomic) UIImageView *playerActive;
//@property (strong, nonatomic) UIColor *circleColor;
//@property (strong, nonatomic) int active;


@end


@implementation ElementsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


// When a finger touches the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    //self.playerActive = [[UIImage imageNamed:@"imageX.png"];
    

//    self.playerActive = [[UIImage imageNamed:@"imageX.png"];
    

    
    NSLog(@"%@ was touched", self);
//    // Get 3 random numbers between 0 and 1
//    float red = (arc4random() % 100) / 100.0;
//    float green = (arc4random() % 100) / 100.0;
//    float blue = (arc4random() % 100) / 100.0;
//    UIColor *randomColor = [UIColor colorWithRed:red
//                                           green:green
//                                            blue:blue
//                                           alpha:1.0];
//    self.circleColor = randomColor;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    UIImage *logoImage = [UIImage imageNamed:@"imageX.png"];
    int h = logoImage.size.height;
    int w = logoImage.size.width;
    
    CGRect rectImage = CGRectMake(center.x-w/2, center.y-h/2, w, h);
    [logoImage drawInRect:rectImage];

}

@end
