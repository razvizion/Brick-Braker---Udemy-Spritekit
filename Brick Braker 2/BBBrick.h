//
//  BBBrick.h
//  Brick Braker 2
//
//  Created by Michał Kozak on 10.05.2014.
//  Copyright (c) 2014 Raz Labs. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static const uint32_t kBrickCategory = 0x1 << 2;

typedef enum : NSUInteger {
    Green = 1,
    Blue = 2,
    Grey = 3,
    Yellow = 4,
} BrickType;

@interface BBBrick : SKSpriteNode

@property (nonatomic) BrickType type;
@property (nonatomic) BOOL indestructible;
@property (nonatomic) BOOL spawnsExtraBall;

-(instancetype)initWithType: (BrickType)type;
-(void)hit;


@end
