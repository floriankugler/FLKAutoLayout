//
// Created by Florian on 22.07.13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSLayoutConstraint+FLKAutoLayoutDebug.h"
#import "UIView+FLKAutoLayoutDebug.h"


@interface NSLayoutConstraint ()

- (NSString *)asciiArtDescription;

@end


@implementation NSLayoutConstraint (FLKAutoLayoutDebug)

#ifdef DEBUG

- (NSString *)description
{
    NSString *description = super.description;
    NSString *asciiArtDescription = self.asciiArtDescription;
    NSString *firstItemTag = [self.firstItem isKindOfClass:[UIView class]] ? [self.firstItem flk_nameTag] : @"";
    NSString *secondItemTag = [self.secondItem isKindOfClass:[UIView class]] ? [self.secondItem flk_nameTag] : @"";
    
    return [description stringByAppendingFormat:@" %@ (%@, %@)", asciiArtDescription, firstItemTag, secondItemTag];
}

#endif

@end