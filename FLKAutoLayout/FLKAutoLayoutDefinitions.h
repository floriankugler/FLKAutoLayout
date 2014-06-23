//
//  FLKAutoLayoutDefinitions.h
//  FLKAutoLayout
//
//  Created by Ali Rantakari on 15/01/2014.
//

#pragma once

#if TARGET_OS_IPHONE

#define FLKView UIView
#define FLKLayoutPriority UILayoutPriority

#else

#define FLKView NSView
#define FLKLayoutPriority NSLayoutPriority

#endif
