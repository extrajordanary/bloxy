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
    CCNode *_cloud1;
    CCNode *_cloud2;
    CCNode *_cloud3;
    CCNode *_cloud4;
    CCNode *_cloud5;
    CCNode *_cloud6;
    CCNode *_cloud7;
    CCNode *_cloud8;
    CCNode *_cloud9;
    CCNode *_cloud10;
    CCNode *_cloud11;
    NSArray *_clouds;
    
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
    _thePhysicsNode.collisionDelegate = self;

    
    _skys = @[_sky1, _sky2];
    _clouds = @[_cloud1, _cloud2, _cloud3, _cloud4, _cloud5, _cloud6, _cloud7,_cloud8,_cloud9, _cloud10, _cloud11];
    
    
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
    // loop the clouds
    for (CCNode *cloud in _clouds) {
//        NSInteger rx = arc4random() % 10;
//        NSInteger ry = arc4random() % 30;
        // get the world position
        CGPoint cloudWorldPosition = [_thePhysicsNode convertToWorldSpace:cloud.position];
        // get the screen position
        CGPoint cloudScreenPosition = [self convertToNodeSpace:cloudWorldPosition];
        // if the bottom corner is one complete sky-width off the screen, move it to the top
        if (cloudScreenPosition.y <= (-1 * _thePhysicsNode.contentSize.height)) {
//            cloud.position = ccp(cloud.position.x + (rx - 5), _thePhysicsNode.position.y + 2 * _thePhysicsNode.contentSize.height + (ry - 15));
            cloud.position = ccp(cloud.position.x, _thePhysicsNode.position.y + 2 * _thePhysicsNode.contentSize.height);
        }
    }
    
    
    //remove older blocks
   // for
    
    
}



-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair block:(CCNode *)block1 block:(CCNode *)block2 {
    [_levelData addDroppedBlockArrayObject:(CCSprite *)block1];
    [_levelData addDroppedBlockArrayObject:(CCSprite *)block2];
    
        return TRUE;
}


@end
