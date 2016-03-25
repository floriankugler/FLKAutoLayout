//
// Created by Florian Kugler
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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

    if ([self respondsToSelector:@selector(_autolayoutTrace)]) {
        return [self performSelector:@selector(_autolayoutTrace)];
    }

#pragma clang diagnostic pop
#endif
    return nil;
}

- (void)setFlk_nameTag:(NSString *)nameTag
{
    objc_setAssociatedObject(self, NameTagKey, nameTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)flk_nameTag
{
    return objc_getAssociatedObject(self, NameTagKey);
}

@end

@implementation UILayoutGuide (FLKAutoLayoutDebug)

- (NSString *)flk_nameTag
{
    return objc_getAssociatedObject(self, NameTagKey);
}

- (void)setFlk_nameTag:(NSString *)nameTag
{
    objc_setAssociatedObject(self, NameTagKey, nameTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
