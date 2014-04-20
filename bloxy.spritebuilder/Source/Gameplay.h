//
//  Gameplay.h
//  bloxy
//
//  Created by Jordan on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "LevelData.h"
#import "Blocks.h"
@interface Gameplay : CCNode




//scrolling data
@property float scrollingCoeficcient;
@property double timeSinceIncrease;
@property double scrollingIncreaseInterval;
@property double scrollingCoeficcientIncrease;
@property NSDate* timeStarted;





@property (nonatomic, strong) LevelData *levelData;
@property float scrollDeltaY;
@property float lastFrameOriginY;
@property CGPoint lastLocation;
@property CGPoint touchPosition;
@end

