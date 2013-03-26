FLKAutoLayout
=============

FLKAutoLayout is a category on UIView which makes it easy to setup layout constraints in code.

FLKAutoLayout creates simple constraints with a readable syntax and provides many convenience methods to setup more complex constraints between multiple views at once. It automatically adds the constraints to the nearest common superview of the views involved and sets the translatesAutoresizingMaskIntoConstraints property on those views to NO.

FLKAutoLayout provides methods on UIView *instances* for simple layout constraints like width and height or constraining an edge of one view to another. Furthermore it provides methods on the UIView *class* for more complex layout constraints where more than two views are involved.

For some examples of how to setup constraints please check the [example project](/dkduck/FLKAutoLayout/blob/master/Example).

## FLKAutoLayout instance methods

Aligning edges of one view to another:

``` objective-c
 // constrain the leading edge of the view to the leading edge of another
[view alignLeadingEdgeWithView:otherView predicate:nil];

 // same as before but use a 20 point offset
[view alignLeadingEdgeWithView:otherView predicate:@"20"];

 // same as before but give this constraint a priority of 750
[view alignLeadingEdgeWithView:otherView predicate:@"20@750"];
```

Constraining width & height:

``` objective-c
[view constrainWidth:@"400"];
[view constrainHeight:@"300"];
// or combined:
[view constrainWidth:@"400" height:@"300"];
// or relative to another view
[view constrainWidthToView:otherView predicate:@"*.3"]; // 30% of otherView's width
[view constrainHeightToView:otherView predicate:@">=*.5"]; // 50% of otherView's width
```

Spacing out two views:

``` objective-c
// creating a >=20 points space between the top edge of one view to the bottom edge of the other
[view constrainTopSpaceToView:otherView predicate:@">=20"];
// creating a >=20 points space between the leading edge of one view to the trailing edge of the other
[view constrainLeadingSpaceToView:otherView predicate:@">=20"];
```

### The predicate argument

Many of the methods take a predicate argument which resembles the syntax Apple uses in their visual format language,
extended by the possibiliy to also specify a multiplier.

[ == | >= | <= ] [ *multipler ] [ constant ] [ @priority ], ...

For example:

``` objective-c
// greater than or equal to 300points, small then 500 points
[view constrainWidth:@">=300,<=500"];
// equal to 300 points
[view constrainWidth:@"300"];
// greater than or equal to 300 points with priority of 250
[view constrainWidth:@">=300@250"];

// greater than or equal to 1/2 of the otherView width
[view constrainWidthToView:otherView predicate:@">=*.5"];
// greater than or equal to 1/2 of the otherView width, smaller than or equal to 600 points with a priority of 100
[view constrainWidthToView:otherView predicate:@">=*.5,<=600@100"];
```

## FLKAutoLayout class methods


## Creator

[Florian Kugler](http://floriankugler.de) ([@floriankugler](https://twitter.com/floriankugler)).

## License

FLKAutoLayout is available under the MIT license. See the LICENSE file for more info.