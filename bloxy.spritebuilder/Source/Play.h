//
//  Play.h
//  bloxy
//
//  Created by Jordan on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Play : CCNode


//scrolling data
@property float scrollDeltaY;
@property float lastFrameOriginY;
@property CGPoint lastLocation;
@property CGPoint touchPosition;
@end
