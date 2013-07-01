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
    UIView *superSuperview;
    UIView *superview;
    UIView *view;
    
    NSLayoutConstraint *theConstraint;
}

- (void)setUp
{
    superSuperview = [[UIView alloc] init];
    superview = [[UIView alloc] init];
    view = [[UIView alloc] init];
    
    [superSuperview addSubview:superview];
    [superview addSubview:view];
    
    theConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
}

- (void)testRemovesFromViewDirectly
{
    [superview addConstraint:theConstraint];
    
    [superview removeConstraintsFromApplicableSuperview:@[theConstraint]];
    
    STAssertFalse([[superview constraints] containsObject:theConstraint], nil);
}

- (void)testRemovesFromDirectSuperview
{
    [superview addConstraint:theConstraint];
    
    [view removeConstraintsFromApplicableSuperview:@[theConstraint]];
    
    STAssertFalse([[superview constraints] containsObject:theConstraint], nil);
}

- (void)testRemoveFromIndirectSuperview
{
    [superSuperview addConstraint:theConstraint];
    
    [view removeConstraintsFromApplicableSuperview:@[theConstraint]];
    
    STAssertFalse([[superSuperview constraints] containsObject:theConstraint], nil);
}


@end
