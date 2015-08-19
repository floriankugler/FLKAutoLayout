//
// Created by Florian on 20.07.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIView+FLKAutoLayoutDebug.h"

static const CGFloat ExerciseAmbiguityInterval = .5;

@implementation UIView (FLKAutoLayoutDebug)

- (void)flk_exerciseAmbiguityInLayout:(BOOL)recursive
{
#ifdef DEBUG
    if (self.hasAmbiguousLayout) {
        [NSTimer scheduledTimerWithTimeInterval:ExerciseAmbiguityInterval target:self selector:@selector(flk_changeAmbiguousLayout) userInfo:nil repeats:YES];
    }
    if (recursive) {
        for (UIView *subview in self.subviews) {
            [subview flk_exerciseAmbiguityInLayout:recursive];
        }
    }
#endif
}

- (void)flk_changeAmbiguousLayout
{
#ifdef DEBUG
    [self exerciseAmbiguityInLayout];
#endif
}

- (NSString *)flk_autolayoutTrace
{
#ifdef DEBUG
    if ([self respondsToSelector:@selector(_autolayoutTrace)]) {
        return [self performSelector:@selector(_autolayoutTrace)];
    }
#endif
    return nil;
}

@end
