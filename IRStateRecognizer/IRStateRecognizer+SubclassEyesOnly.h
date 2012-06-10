//
//  IRStateRecognizer+SubclassEyesOnly.h
//  IRStateRecognizer
//
//  Created by Evadne Wu on 6/10/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRStateRecognizer.h"

@interface IRStateRecognizer (SubclassEyesOnly)

@property (nonatomic, readwrite, assign) IRStateRecognizerState state;

@end
