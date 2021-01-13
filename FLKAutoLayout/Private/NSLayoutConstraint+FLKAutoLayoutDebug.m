#import "NSLayoutConstraint+FLKAutoLayoutDebug.h"
#import "NSObject+FLKAutoLayoutDebug.h"

@interface NSLayoutConstraint ()

- (NSString *)asciiArtDescription;

@end


@implementation NSLayoutConstraint (FLKAutoLayoutDebug)

#ifdef DEBUG

- (NSString *)description
{
    NSString *description = super.description;
    return [description stringByAppendingFormat:@" (%@, %@)", [self.firstItem flk_nameTag], [self.secondItem flk_nameTag]];
}

#endif

@end
