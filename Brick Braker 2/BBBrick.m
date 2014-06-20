//
//  BBBrick.m
//  Brick Braker 2
//
//  Created by Michał Kozak on 10.05.2014.
//  Copyright (c) 2014 Raz Labs. All rights reserved.
//

#import "BBBrick.h"

@implementation BBBrick
{
    SKAction *_brickSmashSound;
    
}

-(instancetype)initWithType:(BrickType)type
{
    switch (type) {
        case Green:
            self = [super initWithImageNamed:@"BrickGreen"];
            break;
        case Blue:
            self = [super initWithImageNamed:@"BrickBlue"];
            break;
        case Grey:
            self = [super initWithImageNamed:@"BrickGrey"];
            break;
        case Yellow:
            self = [super initWithImageNamed:@"BrickYellow"];
            break;
        default:
            self=nil;
            break;
    }
    
    if(self) {
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        self.physicsBody.dynamic = NO;
        self.physicsBody.categoryBitMask = kBrickCategory;
        
        self.type = type;
        
        self.spawnsExtraBall = (type == Yellow);
        self.indestructible = (type == Grey);
        
        _brickSmashSound = [SKAction playSoundFileNamed:@"BrickSmash.caf" waitForCompletion:NO];
        
    }
    return self;
}

-(void)hit{
    switch (self.type) {
        case Green:
            [self crateExplosion];
            [self runAction:_brickSmashSound];
            [self runAction:[SKAction removeFromParent]];
            break;
            
        case Yellow:
            [self crateExplosion];
            [self runAction:_brickSmashSound];
            [self runAction:[SKAction removeFromParent]];
            break;
        case Blue:
            self.texture = [SKTexture textureWithImageNamed:@"BrickGreen"];
            self.type = Green;
            break;
        default:
            // Grey bricks are indestructable.
            break;
    }
    
}

-(void)crateExplosion
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"BrickExplosion" ofType:@"sks"];
    SKEmitterNode *explosion = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    explosion.position = self.position;
    [self.parent addChild:explosion];
    
    SKAction *removeExplosion = [SKAction sequence:@[[SKAction waitForDuration:explosion.particleLifetime+explosion.particleLifetimeRange],[SKAction removeFromParent]]];
    [explosion runAction:removeExplosion];
}

@end
