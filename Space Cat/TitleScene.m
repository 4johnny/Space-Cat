//
//  TitleScene.m
//  Space Cat
//
//  Created by Johnny on 2015-02-15.
//  Copyright (c) 2015 com.lighthouselabs. All rights reserved.
//

#import "TitleScene.h"
#import "GameScene.h"


@implementation TitleScene


- (instancetype)initWithSize:(CGSize)size {
	
	if (self = [super initWithSize:size]) {
		
		SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"splash_1"];
		background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
		
		[self addChild:background];
	}
	
	return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	GameScene* gameScene = [GameScene sceneWithSize:self.frame.size];
	
	SKTransition* transition = [SKTransition fadeWithDuration:1.0];
	
	[self.view presentScene:gameScene transition:transition];
	
	
}


@end
