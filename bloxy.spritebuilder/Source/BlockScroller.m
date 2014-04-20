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
    
    miniBlockArray = [[NSMutableArray alloc] init];
    NSInteger xPos = self.boundingBox.size.width +20;
    NSInteger xOffset= 50;
    
    for (int i=0; i<5; i++) {
        xPos = (i * -xOffset);
        MiniBlock *miniBlock = (MiniBlock *)[CCBReader load:@"MiniBlock"];
          miniBlock.position = ccp(xPos,(self.boundingBox.size.height/2)-5);
        [miniBlockArray addObject:miniBlock];
    }
    
    for (MiniBlock* mb in miniBlockArray){
        [self addChild:mb];
    }

  
}

@end
