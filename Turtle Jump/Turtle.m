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
    turtle.name = @"turtle";
    turtle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:turtle.size];
    
    return turtle;
}

- (void)moveRight {
    SKAction *incrementRight = [SKAction moveByX:10 y:0 duration:0];
    [self runAction:incrementRight];
}
@end
