#import "UIView+FLKAutoLayout.h"
#import "FLKAutoLayoutPredicateList.h"

NSString *const FLKNoConstraint = @"0@1001"; // maximum valid priority is 1000, constraints with a priority > 1000 will be ignored by FLKAutoLayout

typedef NSArray *(^viewChainingBlock)(UIView *view1, UIView *view2);


@implementation UIView (FLKAutoLayout)


#pragma mark Generic constraint methods for two views

- (NSLayoutConstraint *)alignAttribute:(NSLayoutAttribute)attribute toView:(id)view predicate:(NSString *)predicate
{
    NSArray *views = view ? @[view] : nil;
    return [UIView alignAttribute:attribute ofViews:@[self] toViews:views predicate:predicate].firstObject;
}

- (NSLayoutConstraint *)alignAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(id)view predicate:(NSString *)predicate
{
    NSArray *views = view ? @[view] : nil;
    return [UIView alignAttribute:attribute ofViews:@[self] toAttribute:toAttribute ofViews:views predicate:predicate].firstObject;
}


#pragma mark Constrain multiple edges of two views

- (NSArray <NSLayoutConstraint *> *)alignToView:(id)view
{
    return [self alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:view];
}

- (NSArray <NSLayoutConstraint *> *)alignTop:(NSString *)top bottom:(NSString *)bottom toView:(id)view
{
	NSLayoutConstraint *topConstraints = [self alignTopEdgeWithView:view predicate:top];
    NSLayoutConstraint *bottomConstraints = [self alignBottomEdgeWithView:view predicate:bottom];
    return @[topConstraints, bottomConstraints];
}
- (NSArray <NSLayoutConstraint *> *)alignLeading:(NSString *)leading trailing:(NSString *)trailing toView:(id)view
{
	NSLayoutConstraint *leadingConstraints = [self alignLeadingEdgeWithView:view predicate:leading];
    NSLayoutConstraint *trailingConstraints = [self alignTrailingEdgeWithView:view predicate:trailing];
    return @[leadingConstraints, trailingConstraints];
}

- (NSArray <NSLayoutConstraint *> *)alignTop:(NSString *)top leading:(NSString *)leading bottom:(NSString *)bottom trailing:(NSString *)trailing toView:(id)view
{
    NSArray <NSLayoutConstraint *> *topLeadingConstraints = [self alignTop:top leading:leading toView:view];
    NSArray <NSLayoutConstraint *> *bottomTrailingConstraints = [self alignBottom:bottom trailing:trailing toView:view];
    return [topLeadingConstraints arrayByAddingObjectsFromArray: bottomTrailingConstraints];
}

- (NSArray <NSLayoutConstraint *> *)alignTop:(NSString *)top leading:(NSString *)leading toView:(id)view
{
    NSLayoutConstraint *topConstraints = [self alignTopEdgeWithView:view predicate:top];
    NSLayoutConstraint *leadingConstraints = [self alignLeadingEdgeWithView:view predicate:leading];
    return @[topConstraints, leadingConstraints];
}

- (NSArray <NSLayoutConstraint *> *)alignBottom:(NSString *)bottom trailing:(NSString *)trailing toView:(id)view
{
    NSLayoutConstraint *bottomConstraints = [self alignBottomEdgeWithView:view predicate:bottom];
    NSLayoutConstraint *trailingConstraints = [self alignTrailingEdgeWithView:view predicate:trailing];
    return @[bottomConstraints, trailingConstraints];
}


#pragma mark Constraining one edge of two views

- (NSLayoutConstraint *)alignLeadingEdgeWithView:(id)view predicate:(NSString *)predicate
{
    return [self alignAttribute:NSLayoutAttributeLeading toView:view predicate:predicate];
}

- (NSLayoutConstraint *)alignTrailingEdgeWithView:(id)view predicate:(NSString *)predicate
{
    return [self alignAttribute:NSLayoutAttributeTrailing toView:view predicate:predicate];
}

- (NSLayoutConstraint *)alignTopEdgeWithView:(id)view predicate:(NSString *)predicate
{
    return [self alignAttribute:NSLayoutAttributeTop toView:view predicate:predicate];
}

- (NSLayoutConstraint *)alignBottomEdgeWithView:(id)view predicate:(NSString *)predicate {
    return [self alignAttribute:NSLayoutAttributeBottom toView:view predicate:predicate];
}

- (NSLayoutConstraint *)alignBaselineWithView:(id)view predicate:(NSString *)predicate {
    return [self alignAttribute:NSLayoutAttributeBaseline toView:view predicate:predicate];
}

- (NSLayoutConstraint *)alignCenterXWithView:(id)view predicate:(NSString *)predicate {
    return [self alignAttribute:NSLayoutAttributeCenterX toView:view predicate:predicate];
}

- (NSLayoutConstraint *)alignCenterYWithView:(id)view predicate:(NSString *)predicate {
    return [self alignAttribute:NSLayoutAttributeCenterY toView:view predicate:predicate];
}

- (NSArray <NSLayoutConstraint *> *)alignCenterWithView:(id)view
{
    NSLayoutConstraint *centerXConstraints = [self alignCenterXWithView:view predicate:@"0"];
    NSLayoutConstraint *centerYConstraints = [self alignCenterYWithView:view predicate:@"0"];
    return @[centerXConstraints, centerYConstraints];
}


#pragma mark Constrain width & height of a view

- (NSArray <NSLayoutConstraint *> *)constrainWidth:(NSString *)widthPredicate height:(NSString *)heightPredicate
{
    NSLayoutConstraint *widthConstraints = [self constrainWidth:widthPredicate];
    NSLayoutConstraint *heightConstraints = [self constrainHeight:heightPredicate];
    return @[widthConstraints, heightConstraints];
}

- (NSLayoutConstraint *)constrainWidth:(NSString *)widthPredicate
{
    return [self alignAttribute:NSLayoutAttributeWidth toView:nil predicate:widthPredicate];
}

- (NSLayoutConstraint *)constrainHeight:(NSString *)heightPredicate
{
    return [self alignAttribute:NSLayoutAttributeHeight toView:nil predicate:heightPredicate];
}

- (NSLayoutConstraint *)constrainWidthToView:(id)view predicate:(NSString *)predicate
{
    return [self alignAttribute:NSLayoutAttributeWidth toView:view predicate:predicate];
}

- (NSLayoutConstraint *)constrainHeightToView:(id)view predicate:(NSString *)predicate
{
    return [self alignAttribute:NSLayoutAttributeHeight toView:view predicate:predicate];
}

- (NSLayoutConstraint *)constrainAspectRatio:(NSString *)predicate
{
    return [self alignAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeHeight ofView:self predicate:predicate];
}


#pragma mark Spacing out two views

- (NSLayoutConstraint *)constrainLeadingSpaceToView:(id)view predicate:(NSString *)predicate
{
    return [self alignAttribute:NSLayoutAttributeLeading toAttribute:NSLayoutAttributeTrailing ofView:view predicate:predicate];
}

-(NSLayoutConstraint *)constrainTrailingSpaceToView:(UIView *)view predicate:(NSString *)predicate {
    return [self alignAttribute:NSLayoutAttributeTrailing toAttribute:NSLayoutAttributeLeading ofView:view predicate:predicate];
}

- (NSLayoutConstraint *)constrainTopSpaceToView:(id)view predicate:(NSString *)predicate {
    return [self alignAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom ofView:view predicate:predicate];
}

- (NSLayoutConstraint *)constrainBottomSpaceToView:(id)view predicate:(NSString *)predicate {
    return [self alignAttribute:NSLayoutAttributeBottom toAttribute:NSLayoutAttributeTop ofView:view predicate:predicate];
}


#pragma mark Generic constraint methods for multiple views

+ (NSArray <NSLayoutConstraint *> *)alignAttribute:(NSLayoutAttribute)attribute ofViews:(NSArray *)ofViews toViews:(NSArray *)toViews predicate:(NSString *)predicate
{
    return [self alignAttribute:attribute ofViews:ofViews toAttribute:attribute ofViews:toViews predicate:predicate];
}

+ (NSArray <NSLayoutConstraint *> *)alignAttribute:(NSLayoutAttribute)attribute ofViews:(NSArray *)views toAttribute:(NSLayoutAttribute)toAttribute ofViews:(NSArray *)toViews predicate:(NSString *)predicate
{
    NSAssert(views.count == toViews.count || !toViews, @"Aligning attributes of multiple views to multiple views requires both view arrays to be the same length");
    FLKAutoLayoutPredicateList *predicateList = [FLKAutoLayoutPredicateList predicateListFromString:predicate];
    NSMutableArray *constraints = [NSMutableArray array];
    for (NSUInteger i = 0; i < views.count; i++) {
        NSArray *pairConstraints = [predicateList iteratePredicatesUsingBlock:^NSLayoutConstraint *(FLKAutoLayoutPredicate predicateElement) {
            return [views[i] applyPredicate:predicateElement toView:toViews[i] fromAttribute:attribute toAttribute:toAttribute];
        }];
        [constraints addObjectsFromArray:pairConstraints];
    }
    return constraints;
}


#pragma mark Aligning one edge of multiple views

+ (NSArray <NSLayoutConstraint *> *)alignLeadingEdgesOfViews:(NSArray *)views
{
    return [self chainViews:views usingBlock:^NSArray *(UIView *view1, UIView *view2) {
        return @[[view2 alignLeadingEdgeWithView:view1 predicate:@"0"]];
    }];
}

+ (NSArray <NSLayoutConstraint *> *)alignTrailingEdgesOfViews:(NSArray *)views
{
    return [self chainViews:views usingBlock:^NSArray *(UIView *view1, UIView *view2) {
        return @[[view2 alignTrailingEdgeWithView:view1 predicate:@"0"]];
    }];
}

+ (NSArray <NSLayoutConstraint *> *)alignTopEdgesOfViews:(NSArray *)views
{
    return [self chainViews:views usingBlock:^NSArray *(UIView *view1, UIView *view2) {
        return @[[view2 alignTopEdgeWithView:view1 predicate:@"0"]];
    }];
}

+ (NSArray <NSLayoutConstraint *> *)alignBottomEdgesOfViews:(NSArray *)views
{
    return [self chainViews:views usingBlock:^NSArray *(UIView *view1, UIView *view2) {
        return @[[view2 alignBottomEdgeWithView:view1 predicate:@"0"]];
    }];
}

+ (NSArray <NSLayoutConstraint *> *)alignLeadingAndTrailingEdgesOfViews:(NSArray *)views
{
    NSArray *leadingConstraints = [self alignLeadingEdgesOfViews:views];
    NSArray *trailingConstraints = [self alignTrailingEdgesOfViews:views];
    return [leadingConstraints arrayByAddingObjectsFromArray:trailingConstraints];
}

+ (NSArray <NSLayoutConstraint *> *)alignTopAndBottomEdgesOfViews:(NSArray *)views
{
    NSArray *topConstraints = [self alignTopEdgesOfViews:views];
    NSArray *bottomConstraints = [self alignBottomEdgesOfViews:views];
    return [topConstraints arrayByAddingObjectsFromArray:bottomConstraints];
}


#pragma mark Constraining widths & heights of multiple views

+ (NSArray <NSLayoutConstraint *> *)equalWidthForViews:(NSArray *)views
{
    return [self chainViews:views usingBlock:^NSArray *(UIView *view1, UIView *view2) {
        return @[[view2 constrainWidthToView:view1 predicate:@"0"]];
    }];
}

+ (NSArray <NSLayoutConstraint *> *)equalHeightForViews:(NSArray *)views
{
    return [self chainViews:views usingBlock:^NSArray *(UIView *view1, UIView *view2) {
        return @[[view2 constrainHeightToView:view1 predicate:@"0"]];
    }];
}


#pragma mark Space out multiple views

+ (NSArray <NSLayoutConstraint *> *)spaceOutViewsHorizontally:(NSArray *)views predicate:(NSString *)predicate
{
    return [self chainViews:views usingBlock:^NSArray *(UIView *view1, UIView *view2) {
        return @[[view2 constrainLeadingSpaceToView:view1 predicate:predicate]];
    }];
}

+ (NSArray <NSLayoutConstraint *> *)spaceOutViewsVertically:(NSArray *)views predicate:(NSString *)predicate
{
    return [self chainViews:views usingBlock:^NSArray *(UIView *view1, UIView *view2) {
        return @[[view2 constrainTopSpaceToView:view1 predicate:predicate]];
    }];
}

+ (NSArray <NSLayoutConstraint *> *)distributeCenterXOfViews:(NSArray *)views inView:(id)inView
{
    return [self distributeAttribute:NSLayoutAttributeCenterX OfViews:views inView:inView];
}

+ (NSArray <NSLayoutConstraint *> *)distributeCenterYOfViews:(NSArray *)views inView:(id)inView
{
    return [self distributeAttribute:NSLayoutAttributeCenterY OfViews:views inView:inView];
}

+ (NSArray <NSLayoutConstraint *> *)distributeAttribute:(NSLayoutAttribute)attribute OfViews:(NSArray *)views inView:(id)inView
{
    NSAssert(views.count > 1, @"Distribute views requires at least two views");
    CGFloat interval = 2.0f / (views.count - 1);
    CGFloat multiplier = 0;
    NSMutableArray *constraints = [NSMutableArray array];
    for (UIView *view in views) {
        FLKAutoLayoutPredicate predicate = FLKAutoLayoutPredicateMake(NSLayoutRelationEqual, multiplier, 0, 0);
        NSLayoutConstraint *constraint = [view applyPredicate:predicate toView:inView attribute:attribute];
        if (constraint) {
            [constraints addObject:constraint];
        }
        multiplier += interval;
    }
    return constraints;
}


#pragma mark Internal helpers

+ (NSArray <NSLayoutConstraint *> *)chainViews:(NSArray *)views usingBlock:(viewChainingBlock)block
{
    NSAssert(views.count > 1, @"Operations on multiple views require at least 2 views");
    NSMutableArray *constraints = [NSMutableArray array];
    for (NSUInteger i = 1; i < views.count; i++) {
        [constraints addObjectsFromArray:block(views[i-1], views[i])];
    }
    return constraints;
}

@end
