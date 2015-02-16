//
//  ProjectileNode.h
//  Space Cat
//
//  Created by Johnny on 2015-02-16.
//  Copyright (c) 2015 com.lighthouselabs. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ProjectileNode : SKSpriteNode

+ (instancetype)projectileAtPosition:(CGPoint)position;

- (void)moveTowardPosition:(CGPoint)position;

@end
