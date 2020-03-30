//
//  GameViewController.m
//  FlipSample
//
//  Created by Alex on 3/20/20.
//  Copyright © 2020 ClubA. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SKView * skView = (SKView *)self.view;
    skView.ignoresSiblingOrder = YES;
    
    GameScene *scene = [GameScene sceneWithSize:skView.frame.size];
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
