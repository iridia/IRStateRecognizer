//
//  IRStateRecognizer.m
//  IRStateRecognizer
//
//  Created by Evadne Wu on 6/10/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRStateRecognizer.h"
#import "IRStateRecognizerDelegate.h"
#import "IRStateRecognizer+SubclassEyesOnly.h"

@interface IRStateRecognizer ()

@property (nonatomic, readwrite, assign) IRStateRecognizerState state;

@property (nonatomic, readonly, strong) NSMutableDictionary *nonRetainedTargetValuesToActions;
- (NSSet *) allTargets;
- (NSMutableArray *) actionsForTarget:(id)target;

@end


@implementation IRStateRecognizer

@synthesize state = _state;
@synthesize delegate = _delegate;
@synthesize nonRetainedTargetValuesToActions = _nonRetainedTargetValuesToActions;

- (id) initWithTarget:(id)target action:(SEL)action {

	self = [super init];
	if (!self)
		return nil;
	
	[self addTarget:target action:action];
	
	return self;

}

- (void) setState:(IRStateRecognizerState)newState {

	if (_state == newState)
		return;
	
	UIApplication *app = [UIApplication sharedApplication];
	
	for (id target in [self allTargets])
		for (NSString *selString in [self actionsForTarget:target])
			[app sendAction:NSSelectorFromString(selString) to:target from:self forEvent:nil];

}

- (void) addTarget:(id)target action:(SEL)action {

	if (!target || !action)
		return;
		
	[[self actionsForTarget:target] addObject:NSStringFromSelector(action)];
	
}

- (void) removeTarget:(id)target action:(SEL)action {

	[[self actionsForTarget:target] removeObject:NSStringFromSelector(action)];

}

- (NSMutableDictionary *) nonRetainedTargetValuesToActions {

	if (!_nonRetainedTargetValuesToActions) {
		_nonRetainedTargetValuesToActions = [NSMutableDictionary dictionary];
	}
	
	return _nonRetainedTargetValuesToActions;

}

- (NSSet *) allTargets {

	NSArray *allKeys = [_nonRetainedTargetValuesToActions allKeys];
	NSMutableSet *set = [NSMutableSet setWithCapacity:[allKeys count]];
	for (NSValue *nrObjValue in allKeys)
		[set addObject:[nrObjValue nonretainedObjectValue]];
	
	return set;

}

- (NSMutableArray *) actionsForTarget:(id)target {

	id key = [NSValue valueWithNonretainedObject:target];
	NSMutableDictionary *lut = self.nonRetainedTargetValuesToActions;
	NSMutableArray *value = [lut objectForKey:key];
	if (!value) {
		value = [NSMutableArray array];
		[lut setObject:value forKey:key];
	}
	
	return value;

}

@end
