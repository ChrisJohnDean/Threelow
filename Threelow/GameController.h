//
//  GameController.h
//  Threelow
//
//  Created by Chris Dean on 2018-02-14.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property NSMutableArray* rolledDice;
@property NSMutableSet* heldDice;
@property int score;

-(void)holdDie:(int)index;


@end
