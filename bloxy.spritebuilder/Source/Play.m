//
//  Play.m
//  bloxy
//
//  Created by Jordan on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Play.h"

@implementation Play {
    CCNode *_levelNode;
    CCPhysicsNode *_physicsNode;
}

-(void) didLoadFromCCB{
    CCScene *level = [CCBReader loadAsScene:@"Levels/Level1"];
    [_levelNode addChild:level];
    self.userInteractionEnabled = TRUE;
    
    //some initialization code
    self.scrollingIncreaseInterval = -5;
    self.scrollingCoeficcient = 30;
    self.scrollingCoeficcientIncrease =1.1;
    
    
    
}


- (void)onEnter {
    [super onEnter];
    self.timeStarted = [NSDate date];
}

- (void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}
-(void) touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
   
}

-(void) update:(CCTime)delta
{
    self.timeSinceIncrease = [self.timeStarted timeIntervalSinceNow];
    if(self.timeSinceIncrease < self.scrollingIncreaseInterval)
    {
        self.scrollingCoeficcient = self.scrollingCoeficcientIncrease * self.scrollingCoeficcient;
        self.timeStarted = [NSDate date];
    }
    
    _physicsNode.position = ccp(_physicsNode.position.x, _physicsNode.position.y - (delta * self.scrollingCoeficcient));
                        
    
}


@end
