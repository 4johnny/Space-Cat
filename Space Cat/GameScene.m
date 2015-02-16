//
//  GameScene.m
//  Space Cat
//
//  Created by Daniel Mathews on 2014-11-02.
//  Copyright (c) 2014 com.lighthouselabs. All rights reserved.
//

#import "GameScene.h"
#import "MachineNode.h"
#import "SpaceCatNode.h"
#import "ProjectileNode.h"


@implementation GameScene


- (instancetype)initWithSize:(CGSize)size {
	
	if (self = [super initWithSize:size]) {
		
		SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
		background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
		[self addChild:background];
		
		MachineNode* machine = [MachineNode machineAtPosition:CGPointMake(CGRectGetMidX(self.frame), 12)];
		[self addChild:machine];
		
		SpaceCatNode* spaceCat = [SpaceCatNode spaceCatAtPosition:CGPointMake(machine.position.x, machine.position.y-2)];
		[self addChild:spaceCat];
	}
	
	return self;
}


-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */

	self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Called when a touch begins

	for (UITouch* touch in touches) {
	
		CGPoint position = [touch locationInNode:self];
		[self shootProjectileTowardsPosition:position];
	}
}


-(void)shootProjectileTowardsPosition:(CGPoint)position {
	
	SpaceCatNode* spaceCat = (SpaceCatNode*)[self childNodeWithName:@"SpaceCat"];
	[spaceCat performTap];
	
	MachineNode* machine = (MachineNode*)[self childNodeWithName:@"Machine"];
	ProjectileNode* projectile = [ProjectileNode projectileAtPosition:CGPointMake(machine.position.x, machine.position.y + machine.frame.size.height - 10)];
	[self addChild:projectile];
	[projectile moveTowardPosition:position];
}



/*
-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
	
	NSLog(@"%f", fmod(currentTime, 60));
}
*/


@end
