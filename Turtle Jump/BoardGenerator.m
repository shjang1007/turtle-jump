//
//  BoardGenerator.m
//  Turtle Jump
//
//  Created by Sung Jin Kim on 5/24/17.
//  Copyright © 2017 SJ Kim, Brian Jang. All rights reserved.
//

#import "BoardGenerator.h"

@interface BoardGenerator()
@property double currentStepY;
@property double currentObstacleY;
@property SKNode *board;
@end

@implementation BoardGenerator

+ (id)generatorWithBoard:(SKNode *)board {
    BoardGenerator *generator = [BoardGenerator node];
    generator.currentStepY = 0;
    generator.currentObstacleY = 400;
    generator.board = board;
    return generator;
}

- (void)populate {
    for (int i = 0; i < 3; i++) {
        [self generate];
    }
}

- (void)generate {
//    SKSpriteNode *step = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(self.scene.frame.size.width, 20)];
    SKSpriteNode *step = [SKSpriteNode spriteNodeWithColor:[self getRandomColor] size:CGSizeMake(self.scene.frame.size.width, 20)];
    step.name = @"step";
    step.position = CGPointMake(0, self.currentStepY);
    step.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:step.size];
    step.physicsBody.dynamic = NO;
    
    [self.board addChild:step];
    
    self.currentStepY += 50;
}

- (UIColor *)getRandomColor {
    int rand = arc4random() % 4;
    
    UIColor *color;
    switch (rand) {
        case 0:
        case 1:
        case 2:
            color = [UIColor greenColor];
            break;
        case 3:
            color = [UIColor blueColor];
            break;
        default:
            break;
    }
    
    return color;
}

@end
