//
//  Gameplay.m
//  bloxy
//
//  Created by Jordan on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay {
    CCPhysicsNode *_thePhysicsNode;
    CCNode *_sky1;
    CCNode *_sky2;
    NSArray *_skys;
    
    //CCNode *_levelNode;
    
    //CCPhysicsNode *_physicsNode;
    
    //CCNode *_contentNode;
    //CCNode *_nextBlockWindow;
    
}

-(void) didLoadFromCCB{
    self.userInteractionEnabled = TRUE;
    _levelData = [[LevelData alloc] init];
    
    //some initialization code
    self.scrollingIncreaseInterval = -5;
    self.scrollingCoeficcient = .01;
    self.scrollingCoeficcientIncrease =1.1;
    
    _skys = @[_sky1, _sky2];
    
    
}


- (void)onEnter {
    [super onEnter];
    self.timeStarted = [NSDate date];
}

- (void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCSprite *sprite = [_levelData popBlock];
    [_thePhysicsNode addChild:sprite];
    CGPoint touchPos = [touch locationInNode:self];
    CGPoint touchWorld = [self convertToWorldSpace:touchPos];
    CGPoint touchPhysicsNode = [_thePhysicsNode convertToNodeSpace:touchWorld];
    sprite.position = ccp(touchPhysicsNode.x,touchPhysicsNode.y);
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
    
    _thePhysicsNode.position = ccp(_thePhysicsNode.position.x, _thePhysicsNode.position.y + (delta * self.scrollingCoeficcient));
    
    // loop the background
    for (CCNode *sky in _skys) {
        // get the world position of the sky
        CGPoint skyWorldPosition = [_thePhysicsNode convertToWorldSpace:sky.position];
        // get the screen position of the ground
        CGPoint skyScreenPosition = [self convertToNodeSpace:skyWorldPosition];
        // if the bottom corner is one complete width off the screen, move it to the top
        if (skyScreenPosition.y <= (-1 * sky.contentSize.height)) {
            sky.position = ccp(sky.position.x, sky.position.y + 2 * sky.contentSize.height);
        }
    }
}




@end
