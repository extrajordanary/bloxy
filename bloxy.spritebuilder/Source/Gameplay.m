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
    _levelData = [LevelData sharedManager];
    
    //some initialization code
    self.scrollingIncreaseInterval = -5;
    self.scrollingCoeficcient = .02;
    self.scrollingCoeficcientIncrease =1.1;
    _thePhysicsNode.collisionDelegate = self;

    
    _skys = @[_sky1, _sky2];
    _clouds = @[_cloud1, _cloud2, _cloud3, _cloud4, _cloud5, _cloud6, _cloud7,_cloud8,_cloud9, _cloud10, _cloud11];
    
    
}


- (void)onEnter {
    [super onEnter];
    self.timeStarted = [NSDate date];
    [self populateList];
    _blockPreviewArray = [NSMutableArray array];
    
    
}

-(void) populateList
{
    for (CCSprite * ccs in _blockPreviewArray)
    {
        
        [self removeChild:ccs];
        
    }
    [_blockPreviewArray removeAllObjects];
    for (int i=0; i <[_levelData getBlockArray].count-1; i++) {
        //CCSprite *currentBlock = (CCSprite *)[CCBReader load:@"ShapeSprites/RectBigV"];
         CCSprite *currentBlock = [[_levelData getBlockArray] objectAtIndex:i];
        CCSpriteFrame *blockSpriteFrame = currentBlock.spriteFrame;
        CCSprite *previewSprite = [CCSprite spriteWithSpriteFrame:blockSpriteFrame];
        previewSprite.scale = 0.2f;
        if (i == 0)
            previewSprite.scale = 0.6f;
        previewSprite.position =ccp( i * -50 + 300, 450 );
        [_blockPreviewArray addObject:previewSprite];
        
    }
    for (CCSprite * ccs in _blockPreviewArray)
    {
        [self addChild:ccs];
    }

}

- (void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCSprite *sprite = [_levelData popBlock];
    [self populateList];
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
    BOOL allBlocksBelowBottom = NO;

    self.timeSinceIncrease = [self.timeStarted timeIntervalSinceNow];
    if(self.timeSinceIncrease < self.scrollingIncreaseInterval)
    {
        self.scrollingCoeficcient = self.scrollingCoeficcientIncrease * self.scrollingCoeficcient;
        self.timeStarted = [NSDate date];
    }
    
    _thePhysicsNode.position = ccp(_thePhysicsNode.position.x, _thePhysicsNode.position.y + (delta * self.scrollingCoeficcient));
    

//    // loop the background
//    for (CCNode *sky in _skys) {
//        // get the world position of the sky
//        CGPoint skyWorldPosition = [_thePhysicsNode convertToWorldSpace:sky.position];
//        // get the screen position of the ground
//        CGPoint skyScreenPosition = [self convertToNodeSpace:skyWorldPosition];
//        // if the bottom corner is one complete width off the screen, move it to the top
//        if (skyScreenPosition.y <= (-1 * sky.contentSize.height)) {
//            sky.position = ccp(sky.position.x, sky.position.y + 2 * sky.contentSize.height);
//        }
//    }
    // loop the clouds
    for (CCNode *cloud in _clouds) {
        NSInteger rx = arc4random() % 100;
        // get the world position
        CGPoint cloudWorldPosition = [_thePhysicsNode convertToWorldSpace:cloud.position];
        // get the screen position
        CGPoint cloudScreenPosition = [self convertToNodeSpace:cloudWorldPosition];
        // if the bottom corner is one complete sky-width off the screen, move it to the top
        if (cloudScreenPosition.y <= (-1 * _thePhysicsNode.contentSize.height) - 50) {
            cloud.position = ccp(cloud.position.x  + (rx - 50), cloud.position.y + 2272);
        }
    }
    
    
    //remove older blocks
    NSMutableArray *arry = [_levelData getDroppedBlockArray];
    if (arry.count != 0){
        allBlocksBelowBottom = YES;
        for (CCSprite *ccs in arry)
        {
            
            CGPoint pos = [ccs position];
            CGPoint globalPos = [_thePhysicsNode convertToWorldSpace:pos];
            [self convertToNodeSpace:globalPos];
            
            if (globalPos.y > -100)
                allBlocksBelowBottom = NO;
        }
    }
    
    //determine end
    if (allBlocksBelowBottom)
    {
        CCLOG(@"GAME OVER");
    }
    
}



-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair block:(CCNode *)block1 block:(CCNode *)block2 {
    [_levelData addDroppedBlockArrayObject:(CCSprite *)block1];
    [_levelData addDroppedBlockArrayObject:(CCSprite *)block2];
    
        return TRUE;
}


@end
