//
//  UIView+FLKAutoLayoutTests.m
//  FLKAutoLayout Tests
//
//  Created by Robert Gilliam on 7/1/13.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "UIView+FLKAutoLayout.h"

@interface RemoveConstraintsFromApplicableSuperviewTests : SenTestCase

@end



@implementation RemoveConstraintsFromApplicableSuperviewTests {
    UIWindow *window;
    UIView *superSuperview;
    UIView *superview;
    UIView *view;
    
    NSLayoutConstraint *constraintConcerningSuperviewAndView;
}

- (void)setUp
{
    window = [[UIWindow alloc] init];

    superSuperview = [[UIView alloc] init];
    superview = [[UIView alloc] init];
    view = [[UIView alloc] init];
    
    [superSuperview addSubview:superview];
    [superview addSubview:view];
    
    constraintConcerningSuperviewAndView = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    [window addSubview:superSuperview];
    [window makeKeyAndVisible];
}

- (void)testRemovesFromViewDirectly
{
    [superview addConstraint:constraintConcerningSuperviewAndView];
    
    [superview removeConstraintsFromApplicableSuperview:@[constraintConcerningSuperviewAndView]];
    
    STAssertFalse([[superview constraints] containsObject:constraintConcerningSuperviewAndView], nil);
}

- (void)testRemovesFromDirectSuperview
{
    [superview addConstraint:constraintConcerningSuperviewAndView];
    
    [view removeConstraintsFromApplicableSuperview:@[constraintConcerningSuperviewAndView]];
    
    STAssertFalse([[superview constraints] containsObject:constraintConcerningSuperviewAndView], nil);
}

- (void)testRemoveFromIndirectSuperview
{
    [superSuperview addConstraint:constraintConcerningSuperviewAndView];
    
    [view removeConstraintsFromApplicableSuperview:@[constraintConcerningSuperviewAndView]];
    
    STAssertFalse([[superSuperview constraints] containsObject:constraintConcerningSuperviewAndView], nil);
}

- (void)testRemoveFromIndirectSuperviewConstraintAppliesToIndirectSuperview
{
    NSLayoutConstraint *constraintConcerningSuperSuperViewAndView = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBaseline relatedBy:NSLayoutRelationEqual toItem:superSuperview attribute:NSLayoutAttributeBaseline multiplier:1.0 constant:0.0];
    
    [superSuperview addConstraint:constraintConcerningSuperSuperViewAndView];
    
    [view removeConstraintsFromApplicableSuperview:@[constraintConcerningSuperSuperViewAndView]];
    
    STAssertFalse([[superSuperview constraints] containsObject:constraintConcerningSuperSuperViewAndView], nil);
}

- (void)testDoesNotRemoveConstraintBetweenSubviews
{
    [superview addConstraint:constraintConcerningSuperviewAndView];
    
    [superSuperview removeConstraintsFromApplicableSuperview:@[constraintConcerningSuperviewAndView]];
    
    STAssertTrue([[superview constraints] containsObject:constraintConcerningSuperviewAndView], nil);
}


@end
