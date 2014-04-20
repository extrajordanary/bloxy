//
//  Play.m
//  bloxy
//
//  Created by Jordan on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Play.h"

@implementation Play {
    CCNode *_levelNode;
}

-(void) didLoadFromCCB{
    CCScene *level = [CCBReader loadAsScene:@"Levels/Level1"];
    [_levelNode addChild:level];
}

@end
