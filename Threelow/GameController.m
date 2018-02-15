//
//  GameController.m
//  Threelow
//
//  Created by Chris Dean on 2018-02-14.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.rolledDice = [[NSMutableArray alloc] init];
        self.heldDice = [[NSMutableSet alloc] init];
        
        for(int i = 0; i < 5; i++) {
            Dice *dice = [[Dice alloc] init];
            [self.rolledDice addObject:dice];
        }
    }
    return self;
}

-(void)holdDie:(int)index {
    [self.heldDice addObject:self.rolledDice[index]];
    Dice* dice = self.rolledDice[index];
    self.score += dice.faceValue;
}

@end
