//
// Created by florian on 25.03.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "FLKAutoLayoutDefinitions.h"

@interface FLKView (FLKAutoLayout)

- (NSArray*)alignAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(FLKView*)view predicate:(NSString*)predicate;


- (NSArray*)alignToView:(FLKView*)view;
- (NSArray*)alignTop:(NSString*)top leading:(NSString*)leading bottom:(NSString*)bottom trailing:(NSString*)trailing toView:(FLKView*)view;
- (NSArray*)alignTop:(NSString*)top leading:(NSString*)leading toView:(FLKView*)view;
- (NSArray*)alignBottom:(NSString*)bottom trailing:(NSString*)trailing toView:(FLKView*)view;
- (NSArray*)alignTop:(NSString*)top bottom:(NSString*)bottom toView:(FLKView*)view;
- (NSArray*)alignLeading:(NSString*)leading trailing:(NSString*)trailing toView:(FLKView*)view;


- (NSArray*)alignLeadingEdgeWithView:(FLKView*)view predicate:(NSString*)predicate;
- (NSArray*)alignTrailingEdgeWithView:(FLKView*)view predicate:(NSString*)predicate;
- (NSArray*)alignTopEdgeWithView:(FLKView*)view predicate:(NSString*)predicate;
- (NSArray*)alignBottomEdgeWithView:(FLKView*)view predicate:(NSString*)predicate;

- (NSArray*)alignBaselineWithView:(FLKView*)view predicate:(NSString*)predicate;
- (NSArray*)alignCenterXWithView:(FLKView*)view predicate:(NSString*)predicate;
- (NSArray*)alignCenterYWithView:(FLKView*)view predicate:(NSString*)predicate;
- (NSArray*)alignCenterWithView:(FLKView*)view;


- (NSArray*)constrainWidth:(NSString*)widthPredicate height:(NSString*)heightPredicate;
- (NSArray*)constrainWidth:(NSString*)widthPredicate;
- (NSArray*)constrainHeight:(NSString*)heightPredicate;

- (NSArray*)constrainWidthToView:(FLKView*)view predicate:(NSString*)predicate;
- (NSArray*)constrainHeightToView:(FLKView*)view predicate:(NSString*)predicate;


- (NSArray*)constrainTopSpaceToView:(FLKView*)view predicate:(NSString*)predicate;
- (NSArray*)constrainLeadingSpaceToView:(FLKView*)view predicate:(NSString*)predicate;



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

+ (NSArray*)distributeCenterXOfViews:(NSArray*)views inView:(FLKView*)view;
+ (NSArray*)distributeCenterYOfViews:(NSArray*)views inView:(FLKView*)inView;

@end