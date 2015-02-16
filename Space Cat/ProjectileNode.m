//
//  ProjectileNode.m
//  Space Cat
//
//  Created by Johnny on 2015-02-16.
//  Copyright (c) 2015 com.lighthouselabs. All rights reserved.
//

#import "ProjectileNode.h"


@implementation ProjectileNode


+ (instancetype)projectileAtPosition:(CGPoint)position {
	
	ProjectileNode* projectile = [self spriteNodeWithImageNamed:@"projectile_1"];
	projectile.position = position;
	projectile.name = @"Projectile";
	[projectile setupAnimation];
	
	return projectile;
}


- (void)setupAnimation {
	
	NSArray* textures = @[[SKTexture textureWithImageNamed:@"projectile_1"],
						  [SKTexture textureWithImageNamed:@"projectile_2"],
						  [SKTexture textureWithImageNamed:@"projectile_3"]
						  ];
	
	SKAction* animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
	SKAction* repeatAction = [SKAction repeatActionForever:animation];

	[self runAction:repeatAction];
}


- (void)moveTowardPosition:(CGPoint)position {
	
	// Point 1 = starting position
	// Point 2 = offscreen position
	// Point 3 = touch position, between Points 1 & 2
	
	// slope = (Y3 - Y1) / (X3 - X1)
	float slope = (position.y - self.position.y) / (position.x - self.position.x);
	
	// slope = (Y2 - Y1) / (X2 - X1)
	// (Y2 - Y1) = slope * (X2 - X1)
	// Y2 = slope * (X2 - X1) + Y1
	float offscreenX;
	if (position.x <= self.position.x) { // left side of screen
		
		offscreenX = -10.0;  // Enough to get whole projective off screen
		
	} else { // right side of screen
		
		offscreenX = self.parent.frame.size.width + 10.0;
	}
	float offscreenY = slope * (offscreenX - self.position.x) + self.position.y;
	CGPoint pointOffscreen = CGPointMake(offscreenX, offscreenY);
	
	float distanceY = pointOffscreen.y - self.position.y;
	float distanceX = pointOffscreen.x - self.position.x;
	float distanceProjectile = sqrtf(powf(distanceX, 2.0) + powf(distanceY, 2.0));
	
	// speed = distance / time
	// time = distance / speed
	float time = distanceProjectile / 400.0;
	
	SKAction* moveProjectile = [SKAction moveTo:pointOffscreen duration:time];
	
	[self runAction:moveProjectile];
	
}


@end
