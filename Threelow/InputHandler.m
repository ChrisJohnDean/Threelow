//
//  InputHandler.m
//  Threelow
//
//  Created by Chris Dean on 2018-02-14.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

+(NSString*)parseInput:(NSString*)promptString {
    //255 unit long array of characters
    char inputAnswer[255];
    
    //ask user for input
    NSLog(@"%@", promptString);
    
    //get input as a C string
    fgets(inputAnswer, 255, stdin);
    
    //convert C string to NSString
    NSString *userAnswer = [NSString stringWithCString:inputAnswer encoding:NSUTF8StringEncoding];
    
    //get character set of whitespace and new lines
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    //trim whitespace and new lines input answer using character set
    NSString *trimmedAnswer = [userAnswer stringByTrimmingCharactersInSet: set];
    
    return trimmedAnswer;
}

@end
