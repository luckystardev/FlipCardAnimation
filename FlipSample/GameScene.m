//
//  GameScene.m
//  FlipSample
//
//  Created by Alex on 3/20/20.
//  Copyright © 2020 ClubA. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    
    SKSpriteNode *card;
    float cx1, cx2, cy;
    NSString *cardName1, *cardName2;
    float flip_duration;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    cy = 700;
    cx1 = 400;
    cx2 = 160;
    flip_duration = 0.8;
    
    cardName1 = @"cardb";
    cardName2 = @"cardf";
    
    self.backgroundColor = [SKColor systemGreenColor];    
    
    card = [SKSpriteNode spriteNodeWithImageNamed:cardName1];
    card.position = CGPointMake(cx1, cy);
    card.anchorPoint = CGPointMake(0, 0.5);
    card.xScale = -1;
    [self addChild:card];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (card.position.x == cx1) {
        [self frontAction];
    } else {
        [self backAction];
    }
}

- (void)frontAction {
    SKAction *move = [SKAction moveToX:cx2 duration:flip_duration];
    SKAction *flip = [SKAction scaleXTo:1 duration:flip_duration];
    SKAction *flipimg = [SKAction animateWithTextures:[NSArray arrayWithObjects:[SKTexture textureWithImageNamed:cardName1],
        [SKTexture textureWithImageNamed:cardName2], nil] timePerFrame:flip_duration/2 resize:NO restore:NO];
    
    [card runAction:move];
    [card runAction:flip];
    [card runAction:flipimg];
//    [card runAction: [SKAction sequence:@[move, flip]]];
}

- (void)backAction {
    SKAction *move = [SKAction moveToX:cx1 duration:flip_duration];
    SKAction *flip = [SKAction scaleXTo:-1 duration:flip_duration];
    SKAction *flipimg = [SKAction animateWithTextures:[NSArray arrayWithObjects:[SKTexture textureWithImageNamed:cardName2],
    [SKTexture textureWithImageNamed:cardName1], nil] timePerFrame:flip_duration/2 resize:NO restore:NO];
    
    [card runAction:move];
    [card runAction:flip];
    [card runAction:flipimg];
}


@end
