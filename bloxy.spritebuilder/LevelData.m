//
//  LevelData.m
//  bloxy
//
//  Created by David Ott on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelData.h"
#import "BigRect.h"
#import "RectLong.h"
#import "RectMed.h"
#import "SquareBig.h"
#import "SquareSm.h"
#import "Block.h"

@implementation LevelData

-(id) init
{
    self = [super init];
    if (self)
    {
        self.blockArray = [NSMutableArray array];
        _droppedBlockArray = [NSMutableArray array];
        //_blockArraySize = 5;
        for (int i =0; i<5; i++)
        {
            [self addBlock];
        }
            
            
            
        return self;
    }
    else
        return NULL;
}
-(void) addBlock
{
    NSInteger r = arc4random() % 7;
    //[_blockArray addObject:r];
    switch (r) {
        case 1: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"ShapeSprites/RectBigH"];
            block.physicsBody.collisionType = @"block";
            [_blockArray addObject:block];
                        break;
        }
        case 2: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"ShapeSprites/RectBigV"];
            block.physicsBody.collisionType = @"block";
            [_blockArray addObject:block];
            break;
        }
        case 3: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"ShapeSprites/RectBigH"];
            block.physicsBody.collisionType = @"block";
            [_blockArray addObject:block];
            break;
        }
        case 4: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"ShapeSprites/RectBigV"];
            block.physicsBody.collisionType = @"block";
            [_blockArray addObject:block];
            break;
        }
        case 5: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"ShapeSprites/SquareBig"];
            block.physicsBody.collisionType = @"block";
            [_blockArray addObject:block];
            break;
        }
        case 6: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"ShapeSprites/SquareSm"];
            block.physicsBody.collisionType = @"block";
            [_blockArray addObject:block];
            break;
        }
            
        default:
            break;
            

    }
    
}

-(CCSprite*) popBlock
{
    CCSprite *sprite = [_blockArray firstObject];
    [_blockArray removeObjectAtIndex:0];
    while (_blockArray.count < 4)
        [self addBlock];
    
    return sprite;
    
}
-(void) addDroppedBlockArrayObject:(CCSprite *)object
{
    if (![_droppedBlockArray containsObject:object])
    {
        [_droppedBlockArray addObject:object];
        CCLOG(@"%i",_droppedBlockArray.count);
    }
}

@end
