@import Foundation;

typedef struct {
    NSLayoutRelation relation;
    CGFloat multiplier;
    CGFloat constant;
    UILayoutPriority priority;
} FLKAutoLayoutPredicate;

FOUNDATION_EXTERN FLKAutoLayoutPredicate FLKAutoLayoutPredicateMake(NSLayoutRelation relation, CGFloat multiplier, CGFloat constant, UILayoutPriority priority);

@interface UIView (FLKAutoLayoutPredicate)

- (NSLayoutConstraint *)applyPredicate:(FLKAutoLayoutPredicate)predicate toView:(id)viewOrLayoutGuide attribute:(NSLayoutAttribute)attribute;
- (NSLayoutConstraint *)applyPredicate:(FLKAutoLayoutPredicate)predicate toView:(id)viewOrLayoutGuide fromAttribute:(NSLayoutAttribute)fromAttribute toAttribute:(NSLayoutAttribute)toAttribute;

@end
