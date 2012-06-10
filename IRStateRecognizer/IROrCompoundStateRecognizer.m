//
//  IROrCompoundStateRecognizer.m
//  IRStateRecognizer
//
//  Created by Evadne Wu on 6/10/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IROrCompoundStateRecognizer.h"
#import "IRCompoundStateRecognizer+SubclassEyesOnly.h"
#import "IRStateRecognizer+SubclassEyesOnly.h"

@implementation IROrCompoundStateRecognizer

- (void) updateState {

	for (IRStateRecognizer *aSR in self.recognizers)
	if (aSR.state == IRStateRecognizerStateRecognized) {
		self.state = IRStateRecognizerStateRecognized;
		return;
	}
	
	self.state = IRStateRecognizerStatePossible;

}

@end
