#import "UIView+FLKAutoLayoutDebug.h"

#ifdef DEBUG
static const CGFloat ExerciseAmbiguityInterval = .5;
#endif

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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

    if ([self respondsToSelector:@selector(_autolayoutTrace)]) {
        return [self performSelector:@selector(_autolayoutTrace)];
    }

#pragma clang diagnostic pop
#endif
    return nil;
}

@end
