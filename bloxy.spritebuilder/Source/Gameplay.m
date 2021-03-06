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
    CCNode *_topUI;
    
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
    
    CCNode *triangle1;
    CCNode *triangle2;
    CCNode *triangle3;
    CCNode *triangle4;
    CCNode *triangle5;
    CCNode *circle1;
    CCNode *circle2;
    CCNode *circle3;
    CCNode *circle4;
    CCNode *circle5;
    
    
    NSDate *scoreTimerStart;
    NSTimeInterval scoreTimer;
//    NSDate *lastObstacle;
//    NSTimeInterval timeSinceObstacle;
//    NSTimeInterval obstacleTimer;
//    NSInteger obstacleCount;
    
    CCNode *_timeDisplay;
    CGFloat screenHeight;
    CGFloat screenWidth;
    CGFloat scrollFactor;
    
    CGFloat widthOfScreen;
    CGFloat heightOfScreen;
    }

-(void) didLoadFromCCB{
    self.userInteractionEnabled = TRUE;
    _levelData = [LevelData sharedManager];
    
//    CGSize screenSize = [[[UIScreen mainScreen] bounds] size];
    widthOfScreen  = [[UIScreen mainScreen] bounds].size.height;;
    CGFloat heightOfScreen = [[UIScreen mainScreen] bounds].size.width;
    
    //some initialization code
    self.scrollingIncreaseInterval = -5;
    self.scrollingCoeficcient = .02;
    self.scrollingCoeficcientIncrease =1.1;
    self.maxScrollingSpeed = 5;
    _thePhysicsNode.collisionDelegate = self;
    
//    screenHeight = _thePhysicsNode.contentSizeInPoints.height;
//    screenWidth = _thePhysicsNode.contentSizeInPoints.width;
    screenHeight = 1136;
    screenWidth = 320;
//
//    
//    obstacleTimer = 1;
//    obstacleCount = 0;
//    _obstacles = @[Tri, Circle];
    
    _clouds = @[_cloud1, _cloud2, _cloud3, _cloud4, _cloud5, _cloud6, _cloud7,_cloud8,_cloud9, _cloud10, _cloud11];
    
//    _obstacles = @[circle1, circle2, circle3, triangle1, triangle2, triangle3];
    _obstacles = [NSMutableArray array];
    [_obstacles addObject:circle1];
    [_obstacles addObject:circle2];
    [_obstacles addObject:circle3];
    [_obstacles addObject:triangle1];
    [_obstacles addObject:triangle2];
    [_obstacles addObject:triangle3];

    
}


- (void)onEnter {
    [super onEnter];
    self.timeStarted = [NSDate date];
    
    // record the time to measure length of game for score purposes
    scoreTimerStart = [NSDate date];
    
    [self populateList];
    _blockPreviewArray = [NSMutableArray array];
    _offScreenObstacles = [NSMutableArray array];
    _lastPlaced = [NSDate date];
    
    
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
            previewSprite.scale = 0.25f;
        previewSprite.position =ccp( i * -50 + 300, 450 );
            previewSprite.scale = 0.4f;
//        previewSprite.position =ccp( i * -50 +  widthOfScreen, heightOfScreen - 20 );
        previewSprite.position =ccp( i * -80 +  290, 550 - 20 );
        [_blockPreviewArray addObject:previewSprite];
        
    }
    for (CCSprite * ccs in _blockPreviewArray)
    {
        [self addChild:ccs];
    }

}
//
- (void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    if ([[NSDate date] timeIntervalSinceDate:_lastPlaced]>1)
    {
        CCSprite *sprite = [_levelData popBlock];
        [self populateList];
        [_thePhysicsNode addChild:sprite];
        CGPoint touchPos = [touch locationInNode:self];
        CGPoint touchWorld = [self convertToWorldSpace:touchPos];
        CGPoint touchPhysicsNode = [_thePhysicsNode convertToNodeSpace:touchWorld];
        sprite.position = ccp(touchPhysicsNode.x,touchPhysicsNode.y);
        _lastPlaced = [NSDate date];
    }
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
    if (_scrollingCoeficcient > _maxScrollingSpeed)
        _scrollingCoeficcient = _maxScrollingSpeed;
    
    // loop obstacles
    
    for (CCNode *obstacle in _obstacles) {
     CGPoint obstacleWorldPosition = [_thePhysicsNode convertToWorldSpace:obstacle.position];
       CGPoint obstacleScreenPosition = [self convertToNodeSpace:obstacleWorldPosition];
       if (obstacleScreenPosition.y < -screenHeight) {
          //  if (obstacle.position.y < screenHeight/2) {
                CCLOG (@"Calling..");

            [_offScreenObstacles addObject:obstacle];
        }
    }
    for (CCNode *obstacleToRemove in _offScreenObstacles) {
        [obstacleToRemove removeFromParent];
        [_obstacles removeObject:obstacleToRemove];
        // for each removed obstacle, add a new one
        [self spawnNewObstacle];
    }
    
    // update timer
    scoreTimer = [scoreTimerStart timeIntervalSinceNow];
    
    

    
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
        [_levelData setScore:
         (NSInteger)[NSNumber numberWithFloat:[scoreTimerStart timeIntervalSinceNow]]];
        CCScene *gameoverScene = [CCBReader loadAsScene:@"Gameover"];
        [[CCDirector sharedDirector] replaceScene:gameoverScene];
    }
    
}



-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair block:(CCNode *)block1 block:(CCNode *)block2 {
    [_levelData addDroppedBlockArrayObject:(CCSprite *)block1];
    [_levelData addDroppedBlockArrayObject:(CCSprite *)block2];
    
        return TRUE;
}


- (void)spawnNewObstacle {
    CCLOG(@"spawning");
    NSInteger rx = arc4random() % (NSInteger)screenWidth;
    NSInteger ry = arc4random() % (NSInteger)screenHeight;
    CCNode *previousObstacle = [_obstacles lastObject];
    CGFloat previousObstacleYPosition = previousObstacle.position.y;
//    if (!previousObstacle) {
//        // this is the first obstacle
//        previousObstacleXPosition = firstObstaclePosition;
//    }
    NSInteger r = arc4random() % 3;
    CCSprite *obstacle = [[CCSprite alloc] init];
    switch (r) {
        case 1: {
            obstacle = (CCSprite *)[CCBReader load:@"ShapeSprites/Tri"];
            obstacle.physicsBody.collisionType = @"obstacle";
            CCLOG(@"Tri Obstacle");
            break;
        }
        case 2: {
            obstacle = (CCSprite *)[CCBReader load:@"ShapeSprites/Circle"];
            obstacle.physicsBody.collisionType = @"obstacle";
            CCLOG(@"Circle Obstacle");
            break;
        }
    }

    obstacle.position = ccp(rx, previousObstacleYPosition + screenHeight - ry);
    [_thePhysicsNode addChild:obstacle];
    [_obstacles addObject:obstacle];
}


@end
