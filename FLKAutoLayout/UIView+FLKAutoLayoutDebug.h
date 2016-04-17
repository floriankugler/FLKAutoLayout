@import Foundation;

@interface UIView (FLKAutoLayoutDebug)

/// Triggers AutoLayout to try excercise any ambiguity in the layout
- (void)flk_exerciseAmbiguityInLayout:(BOOL)recursive;

/// Prints the layout tree of the view
- (NSString *)flk_autolayoutTrace;

@end
