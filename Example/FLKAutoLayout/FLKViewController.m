@import FLKAutoLayout;
#import "FLKViewController.h"

@implementation FLKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:backgroundView];
    [backgroundView alignToView:self.view];

    UIView *insetBackgroundView = [[UIView alloc] init];
    insetBackgroundView.backgroundColor = [UIColor whiteColor];
    [backgroundView addSubview:insetBackgroundView];
    [insetBackgroundView alignTop:@"10" leading:@"20" bottom:@"-30" trailing:@"-40" toView:backgroundView];

    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [UIColor redColor];
    [insetBackgroundView addSubview:titleView];
    [titleView alignCenterXWithView:insetBackgroundView predicate:@"0"];
    [titleView alignTopEdgeWithView:insetBackgroundView predicate:@"20"];
    [titleView constrainWidth:@">=200,<=400" height:@"==44"];

    UIView *leftBlock = [[UIView alloc] init];
    leftBlock.backgroundColor = [UIColor darkGrayColor];
    [insetBackgroundView addSubview:leftBlock];
    [leftBlock constrainWidthToView:insetBackgroundView predicate:@"*.5-30"];
    [leftBlock alignLeadingEdgeWithView:insetBackgroundView predicate:@"20"];
    [leftBlock alignBottomEdgeWithView:insetBackgroundView predicate:@"-20"];
    [leftBlock constrainTopSpaceToView:titleView predicate:@"20"];

    UILabel *rightBlock = [[UILabel alloc] init];
    rightBlock.adjustsFontSizeToFitWidth = YES;
    rightBlock.text = @"block2: width, height, top from block1. leading superview centerX + 10.";
    rightBlock.backgroundColor = [UIColor darkGrayColor];
    [insetBackgroundView addSubview:rightBlock];
    [rightBlock constrainWidthToView:leftBlock predicate:@"0"];
    [rightBlock constrainHeightToView:leftBlock predicate:@"0"];
    [rightBlock alignTopEdgeWithView:leftBlock predicate:@"0"];
    [rightBlock alignTrailingEdgeWithView:insetBackgroundView predicate:@"-20"];

    UIView *boxContainer = [[UIView alloc] init];
    boxContainer.backgroundColor = [UIColor blackColor];
    [leftBlock addSubview:boxContainer];
    [boxContainer constrainWidthToView:leftBlock predicate:@"*.8"];
    [boxContainer constrainHeightToView:leftBlock predicate:@"*.7"];
    [boxContainer alignCenterWithView:leftBlock];

    NSMutableArray *boxViews = [NSMutableArray array];
    for (NSUInteger i = 0; i < 5; i++) {
        UIView *bar = [[UIView alloc] init];
        bar.backgroundColor = [UIColor greenColor];
        [boxContainer addSubview:bar];
        [boxViews addObject:bar];
        bar.flk_nameTag = [NSString stringWithFormat:@"Bar view %@", @(i)];
    }
    
    [boxViews[0] constrainWidth:@"100" height:@"100"];
    [UIView equalWidthForViews:boxViews];
    [UIView equalHeightForViews:boxViews];
    [boxViews[0] alignCenterXWithView:leftBlock predicate:@"0"];
    [UIView alignLeadingAndTrailingEdgesOfViews:boxViews];
    [UIView distributeCenterYOfViews:boxViews inView:boxContainer];

    NSMutableArray *labels = [NSMutableArray array];
    for (NSUInteger i = 0; i < boxViews.count; i++) {
        UILabel* label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor whiteColor];
        label.text = [NSString stringWithFormat:@"Label %lu", (unsigned long)i];
        [rightBlock addSubview:label];
        [labels addObject:label];
    }
    [labels[0] constrainWidthToView:rightBlock predicate:@"*.5-20"];
    [labels[0] alignLeadingEdgeWithView:rightBlock predicate:@"10"];
    [UIView alignLeadingAndTrailingEdgesOfViews:labels];
    [UIView alignAttribute:NSLayoutAttributeBottom ofViews:labels toViews:boxViews predicate:@"0"];

    NSMutableArray *textFields = [NSMutableArray array];
    for (NSUInteger i = 0; i < boxViews.count; i++) {
        UITextField* textField = [[UITextField alloc] init];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.text = [NSString stringWithFormat:@"text field %lu", (unsigned long)i];
        [rightBlock addSubview:textField];
        [textFields addObject:textField];
    }
    [textFields[0] constrainLeadingSpaceToView:labels[0] predicate:@"20"];
    [textFields[0] alignTrailingEdgeWithView:rightBlock predicate:@"-10"];
    [UIView alignLeadingAndTrailingEdgesOfViews:textFields];
    [UIView alignAttribute:NSLayoutAttributeBaseline ofViews:textFields toViews:labels predicate:@"0"];


    UIView *buttonContainer = [[UIView alloc] init];
    buttonContainer.backgroundColor = [UIColor blackColor];
    [rightBlock addSubview:buttonContainer];
    [buttonContainer constrainHeight:@"50"];
    [buttonContainer alignLeadingEdgeWithView:rightBlock predicate:@"35"];
    [buttonContainer alignBottomEdgeWithView:rightBlock predicate:@"-10"];
    [buttonContainer alignTrailingEdgeWithView:rightBlock predicate:@"-35"];

    NSMutableArray *buttonViews = [NSMutableArray array];
    for (NSUInteger i = 0; i < 5; i++) {
        UIView *button = [[UIView alloc] init];
        button.backgroundColor = [UIColor whiteColor];
        [buttonContainer addSubview:button];
        [buttonViews addObject:button];
    }
    [buttonViews[0] constrainWidth:@"50" height:@"50"];
    [UIView equalWidthForViews:buttonViews];
    [UIView equalHeightForViews:buttonViews];
    [buttonViews[0] alignBottomEdgeWithView:buttonContainer predicate:@"0"];
    [UIView alignBottomEdgesOfViews:buttonViews];
    [UIView distributeCenterXOfViews:buttonViews inView:buttonContainer];

    UIView *test1 = [[UIView alloc] init];
    [backgroundView addSubview:test1];
    [test1 constrainWidth:@"400" height:@"200"];
    [test1 alignTop:@"0" leading:@"100" toView:backgroundView];
    test1.backgroundColor = [UIColor greenColor];

    UIView *test2 = [[UIView alloc] init];
    [test1 addSubview:test2];
    [test2 constrainWidth:@"300" height:@"50"];
    [test2 alignTop:@"20" leading:@"40" toView:test1];
    test2.backgroundColor = [UIColor redColor];

    UIView *test3 = [[UIView alloc] init];
    [test1 addSubview:test3];
    [test3 constrainWidth:@"300" height:@"50"];
    [test3 alignTop:@"100" leading:@"0" toView:test1];
    test3.backgroundColor = [UIColor redColor];

    UIView *test4 = [[UIView alloc] init];
    [test3 addSubview:test4];
    test4.backgroundColor = [UIColor blueColor];
    test4.translatesAutoresizingMaskIntoConstraints = NO;

    test3.clipsToBounds = NO;
    test2.clipsToBounds = NO;
    test1.clipsToBounds = NO;


    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:test4
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:test2
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1
                                                                   constant:0];
    [backgroundView addConstraint:constraint];

    [test4 alignTop:@"0" bottom:@"0" toView:test3];
    [test4 constrainWidth:@"2"];
    [test4 alignAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeRight ofView:test2 predicate:@"0"];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    NSLog(@"%@", [self.view flk_autolayoutTrace]);
    [self.view flk_exerciseAmbiguityInLayout:YES];
}
@end
