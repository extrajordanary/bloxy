//
//  Block.m
//  bloxy
//
//  Created by David Ott on 4/20/14.
//  Copyright 2014 Apportable. All rights reserved.
//

#import "Block.h"


@implementation Block
- (void)didLoadFromCCB {
    self.physicsBody.collisionType = @"block";
}

- (void)onEnter {
    [super onEnter];
    
}

@end
