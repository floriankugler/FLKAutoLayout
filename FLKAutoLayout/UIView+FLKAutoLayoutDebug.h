//
// Created by Florian on 20.07.13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <UIKit/UIKit.h>


@interface UIView (FLKAutoLayoutDebug)

@property (nonatomic, strong) NSString *flk_nameTag;

- (void)flk_exerciseAmbiguityInLayout:(BOOL)recursive;
- (NSString *)flk_autolayoutTrace;

@end