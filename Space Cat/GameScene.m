//
//  GameScene.m
//  Space Cat
//
//  Created by Daniel Mathews on 2014-11-02.
//  Copyright (c) 2014 com.lighthouselabs. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene


- (instancetype)initWithSize:(CGSize)size {
	
	if (self = [super initWithSize:size]) {
		
		SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
		background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
		[self addChild:background];
		
		SKSpriteNode* machine = [SKSpriteNode spriteNodeWithImageNamed:@"machine_1"];
		machine.position = CGPointMake(CGRectGetMidX(self.frame), 12);
		machine.anchorPoint = CGPointMake(0.5, 0);
		[self addChild:machine];
	}
	
	return self;
}


-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */

	self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

	
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
