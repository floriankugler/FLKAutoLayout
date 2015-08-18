#import <UIKit/UIKit.h>

@interface FLKAutoLayoutGuide : NSObject

@property (nonatomic, readonly, strong) id<UILayoutSupport> layoutGuide;
@property (nonatomic, readonly, strong) UIView *containerView;

- (instancetype)initWithLayoutGuide:(id<UILayoutSupport>)layoutGuide inContainerView:(UIView *)containerView;

@end


@interface UIViewController (FLKAutoLayout)

- (FLKAutoLayoutGuide *)flk_topLayoutGuide;
- (FLKAutoLayoutGuide *)flk_bottomLayoutGuide;

@end
