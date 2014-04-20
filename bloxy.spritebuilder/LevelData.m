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
    NSInteger r = arc4random() % 5;
    //[_blockArray addObject:r];
    
    switch (r) {
        case 1: {
            Block *block = (Block *)[CCBReader load:@"RectBig"];
            [_blockArray addObject:block];
            break;
        }
        case 2: {
            Block *block = (Block *)[CCBReader load:@"RectLong"];
            [_blockArray addObject:block];
            break;
        }
        case 3: {
            Block *block = (Block *)[CCBReader load:@"RectMed"];
            [_blockArray addObject:block];
            break;
        }
        case 4: {
            Block *block = (Block *)[CCBReader load:@"SquareBig"];
            [_blockArray addObject:block];
            break;
        }
        case 5: {
            Block *block = (Block *)[CCBReader load:@"SquareSm"];
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

@end
