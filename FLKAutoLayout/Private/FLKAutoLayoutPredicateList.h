@import Foundation;
#import "UIView+FLKAutoLayoutPredicate.h"

typedef NSLayoutConstraint *(^predicateBlock)(FLKAutoLayoutPredicate predicate);

@interface FLKAutoLayoutPredicateList : NSObject

+ (id)predicateListFromString:(NSString *)string;
- (NSArray *)iteratePredicatesUsingBlock:(predicateBlock)block;

@end
