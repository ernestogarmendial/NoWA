//
//  TTPopButton.m
//  Anywhere
//
//  Created by Mariano D'Agostino on 8/19/15.
//  Copyright (c) 2015 Boris. All rights reserved.
//

#import "TTPopButton.h"
#import <POP/POP.h>


@interface TTPopButton()
- (void)setup;
- (void)scaleToSmall;
- (void)scaleAnimation;
- (void)scaleToDefault;
@end

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation TTPopButton {
    
    id target;
    
    SEL selector;
    
}

+ (instancetype)button {
    return [self buttonWithType:UIButtonTypeCustom];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Private instance methods

- (void)setup {
    
    [super addTarget:self action:@selector(scaleToSmall) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [super addTarget:self action:@selector(scaleAnimation) forControlEvents:UIControlEventTouchUpInside];
    [super addTarget:self action:@selector(scaleToDefault)
    forControlEvents:UIControlEventTouchDragExit];
    
    
    [self scaleToDefault];
    self.userInteractionEnabled = YES;
    
}

- (void)scaleToSmall {
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95f, 0.95f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
    
}

- (void)scaleAnimation {
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 18.0f;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
    [self callPeform];
}

- (void) callPeform {
    self.userInteractionEnabled = NO;
    [self performSelector:@selector(callSelector) withObject:nil afterDelay:.7];
}

- (void) callSelector {
    SuppressPerformSelectorLeakWarning([target performSelector:selector withObject:self];);
    self.userInteractionEnabled = YES;
}

- (void)scaleToDefault
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleDefaultAnimation"];
    
}

- (void) addTarget:(id)_target action:(SEL)_action forControlEvents:(UIControlEvents)controlEvents {
    if(controlEvents == UIControlEventTouchUpInside){
        target = _target;
        selector = _action;
        return;
    }
    [super addTarget:_target action:_action forControlEvents:controlEvents];
}

- (void) setBackgroundColor:(UIColor *)backgroundColor animated:(BOOL) animated{
    if(!animated){
        [self setBackgroundColor:backgroundColor];
        return;
    }
    [UIView animateWithDuration:.5 animations:^{
        [self setBackgroundColor:backgroundColor];
    }];
}

@end

@implementation UIButton(BackgroundColor)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    [self setBackgroundImage:[self imageWithColor:color] forState:state];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
