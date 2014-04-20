//
//  LevelData.h
//  bloxy
//
//  Created by David Ott on 4/20/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevelData : NSObject

@property (nonatomic, strong) NSMutableArray *blockArray;
@property float firstGoalHeight;
@property float secondGoalHeight;
@property float thirdGoalHeight;


@end
