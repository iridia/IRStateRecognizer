//
//  IRStateRecognizerDelegate.h
//  IRStateRecognizer
//
//  Created by Evadne Wu on 6/10/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IRStateRecognizer;

@protocol IRStateRecognizerDelegate <NSObject>

- (void) stateRecognizer:(IRStateRecognizer *)stateRecognizer shouldRecognizeSimultaneouslyWithStateRecognizer:(IRStateRecognizer *)otherStateRecognizer;

@end
