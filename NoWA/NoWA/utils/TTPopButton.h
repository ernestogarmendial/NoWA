//
//  TTPopButton.h
//  Anywhere
//
//  Created by Mariano D'Agostino.
//  Copyright (c) 2015 Boris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTPopButton : UIButton

+ (instancetype)button;

- (void) setup;

- (void) setBackgroundColor:(UIColor *)backgroundColor animated:(BOOL) animated;

@end

@interface UIButton(BackgroundColor)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end
