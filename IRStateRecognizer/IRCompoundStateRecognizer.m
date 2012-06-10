//
//  IRCompoundStateRecognizer.m
//  IRStateRecognizer
//
//  Created by Evadne Wu on 6/10/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRCompoundStateRecognizer.h"
#import "IRCompoundStateRecognizer+SubclassEyesOnly.h"

@implementation IRCompoundStateRecognizer

@synthesize recognizers = _recognizers;

- (id) initWithStateRecognizers:(NSArray *)recognizers {

	self = [super init];
	
	_recognizers = recognizers;
	
	NSIndexSet *is = [NSIndexSet indexSetWithIndexesInRange:(NSRange){ 0, [_recognizers count] }];
	[_recognizers addObserver:self toObjectsAtIndexes:is forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:(__bridge void *)(self)];
	
	return self;

}

- (id) init {

	return [self initWithStateRecognizers:nil];

}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {

	[self updateState];

}

- (void) dealloc {

	NSIndexSet *is = [NSIndexSet indexSetWithIndexesInRange:(NSRange){ 0, [_recognizers count] }];

	[_recognizers removeObserver:self fromObjectsAtIndexes:is forKeyPath:@"state" context:(__bridge void *)(self)];

}

- (void) updateState {

	abort();	//	not reached

}

@end
