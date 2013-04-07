//
// Created by florian on 26.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


typedef struct {
    NSLayoutRelation relation;
    CGFloat multiplier;
    CGFloat constant;
    UILayoutPriority priority;
} FLKAutoLayoutPredicate;

static FLKAutoLayoutPredicate FLKAutoLayoutPredicateMake(NSLayoutRelation relation, CGFloat multiplier, CGFloat constant, UILayoutPriority priority) {
    FLKAutoLayoutPredicate predicate;
    predicate.relation = relation;
    predicate.multiplier = multiplier;
    predicate.constant = constant;
    predicate.priority = priority;
    return predicate;
}


@interface UIView (FLKAutoLayoutPredicate)

- (NSLayoutConstraint*)applyPredicate:(FLKAutoLayoutPredicate)predicate toView:(UIView*)toView attribute:(NSLayoutAttribute)attribute;
- (NSLayoutConstraint*)applyPredicate:(FLKAutoLayoutPredicate)predicate toView:(UIView*)view fromAttribute:(NSLayoutAttribute)fromAttribute toAttribute:(NSLayoutAttribute)toAttribute;

@end