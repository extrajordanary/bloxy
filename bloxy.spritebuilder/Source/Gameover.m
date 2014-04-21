//
//  Gameover.m
//  bloxy
//
//  Created by Jordan on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameover.h"

@implementation Gameover

- (void)startGame {
    CCLOG(@"play button pressed");
    
    CCScene *gameplayScene = [CCBReader loadAsScene:@"gameplay"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
