@import UIKit;
NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NSString * const FLKNoConstraint;

#define LayoutConstraintArray NSArray <NSLayoutConstraint *>
#define ViewArray NSArray <UIView *>

/// A collection of categories for UIViews, note the
/// `view` API can either be a `UIView` subclass or a `FLKAutoLayoutGuide`.

@interface UIView (FLKAutoLayout)


#pragma mark Generic constraint methods for two views

/// Align an attribute of one view to another.
- (NSLayoutConstraint *)alignAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(id)view predicate:(NSString *)predicate;


#pragma mark Constraining multiple edges of two views

/// Aligns all 4 edges to another view
- (LayoutConstraintArray *)alignToView:(id)view;

/// Aligns all 4 edges to another view with different offset
- (LayoutConstraintArray *)alignTop:(NSString *)top leading:(NSString *)leading bottom:(NSString *)bottom trailing:(NSString *)trailing toView:(id)view;

/// Aligns the top and leading edges to another view
- (LayoutConstraintArray *)alignTop:(NSString *)top leading:(NSString *)leading toView:(id)view;

/// Aligns the bottom and trailing edges to another view
- (LayoutConstraintArray *)alignBottom:(NSString *)bottom trailing:(NSString *)trailing toView:(id)view;

/// Aligns the top and bottom edges to another view
- (LayoutConstraintArray *)alignTop:(NSString *)top bottom:(NSString *)bottom toView:(id)view;

/// Aligns the leading and trailing edges to another view
- (LayoutConstraintArray *)alignLeading:(NSString *)leading trailing:(NSString *)trailing toView:(id)view;


#pragma mark Constraining one edge of two views

/// Align the leading edge of this view to another
- (NSLayoutConstraint *)alignLeadingEdgeWithView:(id)view predicate:(NSString *)predicate;

/// Align the trailing edge of this view to another
- (NSLayoutConstraint *)alignTrailingEdgeWithView:(id)view predicate:(NSString *)predicate;

/// Align the top edge of this view to another
- (NSLayoutConstraint *)alignTopEdgeWithView:(id)view predicate:(NSString *)predicate;

/// Align the top edge of this view to another
- (NSLayoutConstraint *)alignBottomEdgeWithView:(id)view predicate:(NSString *)predicate;

/// Aligns the baseline edge of this view to another
- (NSLayoutConstraint *)alignBaselineWithView:(id)view predicate:(NSString *)predicate;

/// Aligns the center of X of this view to another
- (NSLayoutConstraint *)alignCenterXWithView:(id)view predicate:(NSString *)predicate;

/// Aligns the center of Y of this view to another
- (NSLayoutConstraint *)alignCenterYWithView:(id)view predicate:(NSString *)predicate;

/// Aligns the center of X and Y of this view to another
- (LayoutConstraintArray *)alignCenterWithView:(id)view;


#pragma mark Constrain width & height of a view

/// Constrain both the width and height of self
- (LayoutConstraintArray *)constrainWidth:(NSString *)widthPredicate height:(NSString *)heightPredicate;

/// Constrain the width of self
- (NSLayoutConstraint*)constrainWidth:(NSString *)widthPredicate;

/// Constrain the height of self
- (NSLayoutConstraint*)constrainHeight:(NSString *)heightPredicate;

/// Constrain the width of self to another view
- (NSLayoutConstraint*)constrainWidthToView:(id)view predicate:(NSString *)predicate;

/// Constrain the height of self to another view
- (NSLayoutConstraint*)constrainHeightToView:(id)view predicate:(NSString *)predicate;

/// Constrain the aspect ratio of seff
- (NSLayoutConstraint*)constrainAspectRatio:(NSString *)predicate;


#pragma mark Spacing out two views

/// Attach self to flow horizontally _after_ `view`, self.trailing to view.leading
- (NSLayoutConstraint*)constrainLeadingSpaceToView:(id)view predicate:(NSString *)predicate;

/// Attach self to flow horizontally _before_ `view`, self.leading to view.trailing
- (NSLayoutConstraint*)constrainTrailingSpaceToView:(id)view predicate:(NSString *)predicate;

/// Attach self to flow vertically _after_ `view`, self.top to view.bottom
- (NSLayoutConstraint*)constrainTopSpaceToView:(id)view predicate:(NSString *)predicate;

/// Attach self to flow vertically _before_ `view`, self.bottom to view.top
- (NSLayoutConstraint*)constrainBottomSpaceToView:(id)view predicate:(NSString *)predicate;


#pragma mark Generic constraint methods for multiple views

/// Align multiple views to align the same sattribute
+ (LayoutConstraintArray *)alignAttribute:(NSLayoutAttribute)attribute ofViews:(ViewArray *)ofViews toViews:(ViewArray *)toViews predicate:(NSString *)predicate;

/// Align multiple views to align the different attributes
+ (LayoutConstraintArray *)alignAttribute:(NSLayoutAttribute)attribute ofViews:(ViewArray *)views toAttribute:(NSLayoutAttribute)toAttribute ofViews:(ViewArray *)toViews predicate:(NSString *)predicate;


#pragma mark Constraining widths & heights of multiple views

/// Align multiple views to the same width
+ (LayoutConstraintArray *)equalWidthForViews:(ViewArray *)views;

/// Align multiple views to the same width
+ (LayoutConstraintArray *)equalHeightForViews:(ViewArray *)views;


#pragma mark Aligning one edge of multiple views

/// Align multiple views to the same leading edge
+ (LayoutConstraintArray *)alignLeadingEdgesOfViews:(ViewArray *)views;

/// Align multiple views to the same trailing edge
+ (LayoutConstraintArray *)alignTrailingEdgesOfViews:(ViewArray *)views;

/// Align multiple views to the same top edge
+ (LayoutConstraintArray *)alignTopEdgesOfViews:(ViewArray *)views;

/// Align multiple views to the same bottom edge
+ (LayoutConstraintArray *)alignBottomEdgesOfViews:(ViewArray *)views;

/// Align multiple views to the same leading and trailing edge
+ (LayoutConstraintArray *)alignLeadingAndTrailingEdgesOfViews:(ViewArray *)views;

/// Align multiple views to the same top and bottom edge
+ (LayoutConstraintArray *)alignTopAndBottomEdgesOfViews:(ViewArray *)views;

/// Align multiple views via constrainLeadingSpaceToView
+ (LayoutConstraintArray *)spaceOutViewsHorizontally:(ViewArray *)views predicate:(NSString *)predicate;

/// Align multiple views via constrainTopSpaceToView
+ (LayoutConstraintArray *)spaceOutViewsVertically:(ViewArray *)views predicate:(NSString *)predicate;

/// Align multiple views with the same center X
+ (LayoutConstraintArray *)distributeCenterXOfViews:(ViewArray *)views inView:(id)view;

/// Align multiple views with the same center Y
+ (LayoutConstraintArray *)distributeCenterYOfViews:(ViewArray *)views inView:(id)inView;

@end

NS_ASSUME_NONNULL_END