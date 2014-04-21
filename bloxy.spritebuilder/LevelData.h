//
//  LevelData.h
//  bloxy
//
//  Created by David Ott on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LevelData : CCNode

@property (nonatomic,retain) LevelData *sharedLevelData;
@property NSInteger blockArraySize;
@property (nonatomic, strong) NSMutableArray *blockArray;
@property (nonatomic, strong) NSMutableArray *droppedBlockArray;
@property  NSInteger score;

-(void) addBlock;
-(CCSprite*) popBlock;
-(void) addDroppedBlockArrayObject:(CCSprite *)object;
-(NSMutableArray*) getDroppedBlockArray;
-(NSMutableArray*) getBlockArray;

+ (id) sharedManager;
@end

