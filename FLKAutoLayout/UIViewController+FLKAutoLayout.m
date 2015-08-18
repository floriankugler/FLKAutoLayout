#import "UIViewController+FLKAutoLayout.h"

@implementation FLKAutoLayoutGuide

- (instancetype)initWithLayoutGuide:(id<UILayoutSupport>)layoutGuide inContainerView:(UIView *)containerView;
{
    if ((self = [super init])) {
        _layoutGuide = layoutGuide;
        _containerView = containerView;
    }
    return self;
}

@end


@implementation UIViewController (FLKAutoLayout)

- (FLKAutoLayoutGuide *)flk_topLayoutGuide;
{
    return [[FLKAutoLayoutGuide alloc] initWithLayoutGuide:self.topLayoutGuide inContainerView:self.view];
}

- (FLKAutoLayoutGuide *)flk_bottomLayoutGuide;
{
    return [[FLKAutoLayoutGuide alloc] initWithLayoutGuide:self.bottomLayoutGuide inContainerView:self.view];
}

@end
