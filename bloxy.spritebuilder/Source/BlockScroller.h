//
//  BlockScroller.h
//  bloxy
//
//  Created by David Ott on 4/19/14.
//  Copyright 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "LevelData.h"

#import "MiniBlock.h"
#import "Block.h"
#import "SquareSm.h"



@interface BlockScroller : CCLayoutBox {
    NSMutableArray *miniBlockArray;
    

}
@property (nonatomic,assign) float spacing;
@property (nonatomic) LevelData* levelData;

@end
