//
// Created by florian on 25.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <UIKit/UIKit.h>


FOUNDATION_EXTERN NSString * const FLKNoConstraint;

@interface UIView (FLKAutoLayout)

- (NSArray*)alignAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(id)view predicate:(NSString*)predicate;


- (NSArray*)alignToView:(id)view;
- (NSArray*)alignTop:(NSString*)top leading:(NSString*)leading bottom:(NSString*)bottom trailing:(NSString*)trailing toView:(id)view;
- (NSArray*)alignTop:(NSString*)top leading:(NSString*)leading toView:(id)view;
- (NSArray*)alignBottom:(NSString*)bottom trailing:(NSString*)trailing toView:(id)view;
- (NSArray*)alignTop:(NSString*)top bottom:(NSString*)bottom toView:(id)view;
- (NSArray*)alignLeading:(NSString*)leading trailing:(NSString*)trailing toView:(id)view;


- (NSArray*)alignLeadingEdgeWithView:(id)view predicate:(NSString*)predicate;
- (NSArray*)alignTrailingEdgeWithView:(id)view predicate:(NSString*)predicate;
- (NSArray*)alignTopEdgeWithView:(id)view predicate:(NSString*)predicate;
- (NSArray*)alignBottomEdgeWithView:(id)view predicate:(NSString*)predicate;

- (NSArray*)alignBaselineWithView:(id)view predicate:(NSString*)predicate;
- (NSArray*)alignCenterXWithView:(id)view predicate:(NSString*)predicate;
- (NSArray*)alignCenterYWithView:(id)view predicate:(NSString*)predicate;
- (NSArray*)alignCenterWithView:(id)view;


- (NSArray*)constrainWidth:(NSString*)widthPredicate height:(NSString*)heightPredicate;
- (NSArray*)constrainWidth:(NSString*)widthPredicate;
- (NSArray*)constrainHeight:(NSString*)heightPredicate;

- (NSArray*)constrainWidthToView:(id)view predicate:(NSString*)predicate;
- (NSArray*)constrainHeightToView:(id)view predicate:(NSString*)predicate;

- (NSArray*)constrainAspectRatio:(NSString*)predicate;

- (NSArray*)constrainLeadingSpaceToView:(id)view predicate:(NSString*)predicate;
- (NSArray*)constrainTrailingSpaceToView:(id)view predicate:(NSString *)predicate;
- (NSArray*)constrainTopSpaceToView:(id)view predicate:(NSString*)predicate;
- (NSArray*)constrainBottomSpaceToView:(id)view predicate:(NSString*)predicate;


+ (NSArray*)alignAttribute:(NSLayoutAttribute)attribute ofViews:(NSArray*)ofViews toViews:(NSArray*)toViews predicate:(NSString*)predicate;
+ (NSArray*)alignAttribute:(NSLayoutAttribute)attribute ofViews:(NSArray*)views toAttribute:(NSLayoutAttribute)toAttribute ofViews:(NSArray*)toViews predicate:(NSString*)predicate;


+ (NSArray*)equalWidthForViews:(NSArray*)views;
+ (NSArray*)equalHeightForViews:(NSArray*)views;


+ (NSArray*)alignLeadingEdgesOfViews:(NSArray*)views;
+ (NSArray*)alignTrailingEdgesOfViews:(NSArray*)views;
+ (NSArray*)alignTopEdgesOfViews:(NSArray*)views;
+ (NSArray*)alignBottomEdgesOfViews:(NSArray*)views;
+ (NSArray*)alignLeadingAndTrailingEdgesOfViews:(NSArray*)views;
+ (NSArray*)alignTopAndBottomEdgesOfViews:(NSArray*)views;


+ (NSArray*)spaceOutViewsHorizontally:(NSArray*)views predicate:(NSString*)predicate;
+ (NSArray*)spaceOutViewsVertically:(NSArray*)views predicate:(NSString*)predicate;

+ (NSArray*)distributeCenterXOfViews:(NSArray*)views inView:(id)view;
+ (NSArray*)distributeCenterYOfViews:(NSArray*)views inView:(id)inView;

@end
