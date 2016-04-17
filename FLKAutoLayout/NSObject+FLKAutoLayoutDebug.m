#import "NSObject+FLKAutoLayoutDebug.h"
#import <objc/runtime.h>

static char NameTagKey;

@implementation NSObject (FLKAutoLayoutDebug)

- (void)setFlk_nameTag:(NSString *)nameTag
{
    objc_setAssociatedObject(self, &NameTagKey, nameTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)flk_nameTag
{
    return objc_getAssociatedObject(self, &NameTagKey);
}

@end
