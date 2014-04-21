//
//  Gameplay.h
//  bloxy
//
//  Created by Jordan on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "LevelData.h"
#import "Block.h"
@interface Gameplay : CCPhysicsNode <CCPhysicsCollisionDelegate>




//scrolling data
@property float maxScrollingSpeed;

@property float scrollingCoeficcient;
@property double timeSinceIncrease;
@property double scrollingIncreaseInterval;
@property double scrollingCoeficcientIncrease;
@property NSDate* timeStarted;
@property NSDate* lastPlaced;
@property (nonatomic, strong) NSMutableArray *offScreenObstacles;
@property (nonatomic, strong) NSMutableArray *obstacles;



@property (nonatomic, strong) NSMutableArray *blockPreviewArray;

@property (nonatomic, strong) LevelData *levelData;
@property float scrollDeltaY;
@property float lastFrameOriginY;
@property CGPoint lastLocation;
@property CGPoint touchPosition;
@end

