@import Foundation;

@interface NSObject (FLKAutoLayoutDebug)

/// Allows tagging the name on an auto layout contraint
/// This is used in NSLayoutConstraint's description when in DEBUG builds
@property (nonatomic, strong) NSString *flk_nameTag;

@end
