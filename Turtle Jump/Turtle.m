//
//  Turtle.m
//  Turtle Jump
//
//  Created by Sung Jin Kim on 5/23/17.
//  Copyright © 2017 SJ Kim, Brian Jang. All rights reserved.
//

#import "Turtle.h"

@implementation Turtle
+ (id)turtle {
    Turtle *turtle = [Turtle spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(50, 50)];
    
    SKSpriteNode *turtleImg = [SKSpriteNode spriteNodeWithImageNamed:@"turtle.png"];
    [turtle addChild:turtleImg];
    
    turtle.name = @"turtle";
    turtle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:turtle.size];
    static const uint32_t turtleCategory = 0x1 << 1;
    static const uint32_t stepCategory = 0x1 << 2;
    
    turtle.physicsBody.categoryBitMask = turtleCategory;
    turtle.physicsBody.collisionBitMask = stepCategory;
    
    return turtle;
}

- (void)moveRight {
    SKAction *incrementRight = [SKAction moveByX:10 y:0 duration:0];
    [self runAction:incrementRight];
}

- (void)jump {
    [self.physicsBody applyImpulse:CGVectorMake(0, 40)];
}

- (void)start {
    [self.physicsBody applyImpulse:CGVectorMake(0, 250)];
}
@end
