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
    CCNode *_contentNode;
    CCNode *_nextBlockWindow;
    CCPhysicsNode *_physicsNode;

}

-(void) didLoadFromCCB{
    CCScene *level = [CCBReader loadAsScene:@"Levels/Level1"];
    [_levelNode addChild:level];
    CCLOG(@"Play Loaded from ccb");
    self.userInteractionEnabled = TRUE;
}


- (void)onEnter {
    [super onEnter];
}

- (void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}
-(void) touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
   
}

-(void) update:(CCTime)delta
{
    
}


@end
