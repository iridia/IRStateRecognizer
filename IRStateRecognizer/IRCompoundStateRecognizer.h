//
//  IRCompoundStateRecognizer.h
//  IRStateRecognizer
//
//  Created by Evadne Wu on 6/10/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRStateRecognizer.h"

@interface IRCompoundStateRecognizer : IRStateRecognizer

- (id) initWithStateRecognizers:(NSArray *)recognizers;

@property (nonatomic, readonly, strong) NSArray *recognizers;

@end
