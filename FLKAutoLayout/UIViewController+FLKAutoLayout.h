@import UIKit;

/// A NSLayoutGuide for iOS 7 & 8

@interface FLKAutoLayoutGuide : NSObject

/// The actual layout guide
@property (nonatomic, readonly, strong) id<UILayoutSupport> layoutGuide;

/// The view that guide represents
@property (nonatomic, readonly, strong) UIView *containerView;

/// Init
- (instancetype)initWithLayoutGuide:(id<UILayoutSupport>)layoutGuide inContainerView:(UIView *)containerView;

@end


@interface UIViewController (FLKAutoLayout)

/// Creates and strongly retains a topLayoutGuide for the view controller
- (FLKAutoLayoutGuide *)flk_topLayoutGuide;

/// Creates and strongly retains a bottomLayoutGuide for the view controller
- (FLKAutoLayoutGuide *)flk_bottomLayoutGuide;

@end
