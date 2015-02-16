//
//  SpaceCatNode.h
//  Space Cat
//
//  Created by Johnny on 2015-02-15.
//  Copyright (c) 2015 com.lighthouselabs. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SpaceCatNode : SKSpriteNode

+ (instancetype)spaceCatAtPosition:(CGPoint)position;

- (void)performTap;

@end
