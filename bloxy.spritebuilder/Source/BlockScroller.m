//
//  BlockScroller.m
//  bloxy
//
//  Created by David Ott on 4/19/14.
//  Copyright 2014 Apportable. All rights reserved.
//

#import "BlockScroller.h"



@implementation BlockScroller



- (void)didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
}

- (void)onEnter {
    [super onEnter];
    self.spacing = 10;
//    miniBlockArray = [[NSMutableArray alloc] init];
//    NSInteger xPos = self.boundingBox.size.width +20;
//    NSInteger xOffset= 50;
//    CCLOG(@"%f",self.boundingBox.size.width );
//    
//    for (int i=0; i<5; i++) {
//        xPos = (i * -xOffset);
//        MiniBlock *miniBlock = (MiniBlock *)[CCBReader load:@"MiniBlock"];
//          miniBlock.position = ccp(xOffset,(self.boundingBox.size.height/2)-5);
//        [miniBlockArray addObject:miniBlock];
//    }
//    
//    for (MiniBlock* mb in miniBlockArray){
//        [self addChild:mb];
//    }


   //CCSprite *block = (CCSprite *)[CCBReader load:@"SquareSm"];
        //[self addChild:block];
        


    for (int i=0; i<2; i++) {
        MiniBlock *miniBlock = (MiniBlock *)[CCBReader load:@"MiniBlock"];
        [self addChild:miniBlock];
//        Blocks *nextBlock = (Blocks *)[CCBReader load:@"SquareSm"];
//        [self addChild:nextBlock];
        
    }
  
}

-(void) removeBlock{
    
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint pos = [touch locationInNode:self];
    CCLOG(@"%f", pos.x);
    
}
@end
