//
//  Obstacles.m
//  bloxy
//
//  Created by Jordan on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Obstacles.h"

@implementation Obstacles {
    CCNode *Tri;
    CCNode *Circle;
    NSArray *_obstacles;
}

-(void) didLoadFromCCB{
    
    _obstacles = @[Tri, Circle];
    
}



@end
