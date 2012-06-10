//
//  IRStateRecognizer.h
//  IRStateRecognizer
//
//  Created by Evadne Wu on 6/10/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

typedef enum {
  
	IRStateRecognizerStateUnknown = 0,
  
	IRStateRecognizerStatePossible = 1,
	IRStateRecognizerStateBegan,
	IRStateRecognizerStateChanged,
	IRStateRecognizerStateRecognized,
	IRStateRecognizerStateFailed,
	
	IRStateRecognizerStateEnded = IRStateRecognizerStateRecognized
	
} IRStateRecognizerState;


@protocol IRStateRecognizerDelegate;
@interface IRStateRecognizer : NSObject

- (id) initWithTarget:(id)target action:(SEL)action;
- (void) addTarget:(id)target action:(SEL)action;
- (void) removeTarget:(id)target action:(SEL)action;

@property (nonatomic, readonly, assign) IRStateRecognizerState state;
@property (nonatomic, readwrite, weak) id<IRStateRecognizerDelegate> delegate;

@end
