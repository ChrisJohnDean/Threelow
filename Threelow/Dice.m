//
//  Dice.m
//  Threelow
//
//  Created by Chris Dean on 2018-02-14.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(void)roll {
    int value = arc4random_uniform(6) + 1;
    if(value == 3) {
        self.faceValue = 0;
    } else {
        self.faceValue = value;
    }
}

@end
