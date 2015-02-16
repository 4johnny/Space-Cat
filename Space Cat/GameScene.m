//
//  GameScene.m
//  Space Cat
//
//  Created by Daniel Mathews on 2014-11-02.
//  Copyright (c) 2014 com.lighthouselabs. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene


-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */

	self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
	
	CGPoint viewCenter = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
	CGPoint viewOrigin = CGPointMake(viewCenter.x - 384, viewCenter.y - 216);
	
	SKSpriteNode* greenNode = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:CGSizeMake(20, 200)];
	greenNode.position = CGPointMake(viewOrigin.x + 10, viewOrigin.y + 10);
	greenNode.anchorPoint = CGPointMake(0, 0);
	[self addChild:greenNode];
	
	SKSpriteNode* redNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(200, 20)];
	redNode.position = greenNode.position;
	redNode.anchorPoint = CGPointMake(0, 0);
	[self addChild:redNode];
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
