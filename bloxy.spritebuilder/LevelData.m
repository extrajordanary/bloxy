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

@implementation LevelData

-(id) init
{
    self = [super init];
    if (self)
    {
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
   // NSInteger r = arc4random() % 5;
    //[_blockArray addObject:r];
    /*
    switch (r) {
        case 1: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"BigRect"];
            [_blockArray addObject:block];
            break;
        }
        case 2: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"RectLong"];
            [_blockArray addObject:block];
            break;
        }
        case 3: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"RectMed"];
            [_blockArray addObject:block];
            break;
        }
        case 4: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"SquareBig"];
            [_blockArray addObject:block];
            break;
        }
        case 5: {
            CCSprite *block = (CCSprite *)[CCBReader load:@"SquareSm"];
            [_blockArray addObject:block];
            break;
        }
     
            
        default:
            break;
     */
    //}
    
}
/*
-(CCSprite*) popBlock
{
   // CCSprite *sprite = [_blockArray objectAtIndex:[_blockArray lastObject]];
    CCSprite *sprite = (CCSprite *)[CCBReader load:@"SquareSm"];
    NSLog(@"%@" ,sprite);
    return sprite;
}*/

@end
