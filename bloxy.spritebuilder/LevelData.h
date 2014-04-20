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

@property NSInteger blockArraySize;
@property (nonatomic, strong) NSMutableArray *blockArray;
@property (nonatomic, strong) NSMutableArray *droppedBlockArray;

-(void) addBlock;
-(CCSprite*) popBlock;
@end
