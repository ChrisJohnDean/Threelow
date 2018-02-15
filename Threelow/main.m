//
//  main.m
//  Threelow
//
//  Created by Chris Dean on 2018-02-14.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "Dice.h"
#import "GameController.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL dontStop = YES;
        BOOL carryOn = YES;
        GameController *controller = [[GameController alloc] init];
        int diceLeft = 5;
        
        while(dontStop) {
            
            carryOn = YES;
            NSString *trimmedAnswer = [InputHandler parseInput:@"What would you like to do?"];
            
            if([trimmedAnswer isEqualToString:@"roll"]) {
                for(int i = 0; i < diceLeft; i++) {
                    Dice* dice = controller.rolledDice[i];
                    [dice roll];
                    NSLog(@"[Index: %d -> Dice Score: %d]", i, dice.faceValue);
                }
            }
            
            
            
            
            NSLog(@"Type done once you've selcted the dice you want to hold.\n");
            while(carryOn) {
                if(diceLeft == 0) {
                    carryOn = NO;
                    dontStop = NO;
                    continue;
                }
                NSString *indexInput = [InputHandler parseInput:@"What dice would you like to hold?"];
                
                if([indexInput  isEqualToString:@"done"]) {
                    carryOn = NO;
                    continue;
                }
                
                int index = [indexInput intValue];
                [controller holdDie:index];
                diceLeft -= 1;
                Dice* dice = controller.rolledDice[index];
                int diceScore = dice.faceValue;
                
                NSLog(@"You held this dice: [Index: %d -> Dice Score: %d]", index, diceScore);
                
            }

        }
        NSLog(@"Your Score: %d", controller.score);
    }
    return 0;
}
