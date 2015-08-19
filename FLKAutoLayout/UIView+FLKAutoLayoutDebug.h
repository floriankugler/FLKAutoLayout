//
// Created by Florian on 20.07.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface UIView (FLKAutoLayoutDebug)

- (void)flk_exerciseAmbiguityInLayout:(BOOL)recursive;
- (NSString *)flk_autolayoutTrace;

@end
