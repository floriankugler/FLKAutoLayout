//
// Created by Florian on 20.07.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIView+FLKAutoLayoutDebug.h"
#import <objc/runtime.h>

static const CGFloat ExerciseAmbiguityInterval = .5;
static char *const NameTagKey = "flk_nameTag";


@interface UIView ()

- (id)_autolayoutTrace;

@end


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
    [self exerciseAmbiguityInLayout];
}

- (NSString *)flk_autolayoutTrace
{
    if ([self respondsToSelector:@selector(_autolayoutTrace)]) {
        return [self _autolayoutTrace];
    } else {
        return nil;
    }
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