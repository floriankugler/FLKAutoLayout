#import "UIViewController+FLKAutoLayout.h"
#import "NSObject+FLKAutoLayoutDebug.h"

#import <objc/runtime.h>
#import <objc/message.h>

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

static FLKAutoLayoutGuide *
FLKAssociatedAutoLayoutGuide(UIViewController *vc, SEL type, const char *const key)
{
    FLKAutoLayoutGuide *guide = objc_getAssociatedObject(vc, key);
    if (guide == nil) {
        NSObject<UILayoutSupport> *layoutGuide = ((id (*)(id, SEL))objc_msgSend)(vc, type);
        layoutGuide.flk_nameTag = [NSString stringWithFormat:@"%s.%s", class_getName(vc.class), sel_getName(type)];
        guide = [[FLKAutoLayoutGuide alloc] initWithLayoutGuide:layoutGuide inContainerView:vc.view];
        objc_setAssociatedObject(vc, key, guide, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return guide;
}

- (FLKAutoLayoutGuide *)flk_topLayoutGuide;
{
    static char TopLayoutGuideKey;
    return FLKAssociatedAutoLayoutGuide(self, @selector(topLayoutGuide), &TopLayoutGuideKey);
}

- (FLKAutoLayoutGuide *)flk_bottomLayoutGuide;
{
    static char BottomLayoutGuideKey;
    return FLKAssociatedAutoLayoutGuide(self, @selector(bottomLayoutGuide), &BottomLayoutGuideKey);
}

@end
