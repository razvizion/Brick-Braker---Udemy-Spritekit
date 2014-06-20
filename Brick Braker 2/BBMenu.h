//
//  BBMenu.h
//  Brick Braker 2
//
//  Created by Michał Kozak on 12.05.2014.
//  Copyright (c) 2014 Raz Labs. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BBMenu : SKNode

@property (nonatomic)int levelNumber;
-(void)hide;
-(void)show;

@end
