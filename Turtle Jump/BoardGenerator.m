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

static const uint32_t turtleCategory = 0x1 << 1;
static const uint32_t stepCategory = 0x1 << 2;

+ (id)generatorWithBoard:(SKNode *)board {
    BoardGenerator *generator = [BoardGenerator node];
    generator.currentStepY = 0;
    generator.currentObstacleY = 400;
    generator.board = board;
    return generator;
}

- (void)populate {
    SKSpriteNode *ground = [SKSpriteNode spriteNodeWithColor:[UIColor purpleColor] size:CGSizeMake(self.scene.frame.size.width, 20)];

    ground.name = @"ground";
    ground.position = CGPointMake(0, 0);
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = NO;
    ground.physicsBody.categoryBitMask = stepCategory;
    ground.physicsBody.collisionBitMask = turtleCategory;

    [self.board addChild:ground];

    for (int i = 0; i < 13; i++) {
        [self generateStep];
    }
}

- (void)generateStep {
//    SKSpriteNode *step = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(self.scene.frame.size.width, 20)];
    
    int stepWidth = self.scene.frame.size.width / 5;
    int lowerBound = stepWidth / 2;
    int upperBound = self.scene.frame.size.width - stepWidth / 2;
    
    int rand = lowerBound +  arc4random() % (upperBound - lowerBound);
    
    SKSpriteNode *step = [SKSpriteNode spriteNodeWithColor:[self getRandomColor] size:CGSizeMake(stepWidth, 20)];
    step.name = @"step";
    step.position = CGPointMake(rand - self.scene.frame.size.width / 2, self.currentStepY);
    step.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:step.size];
    step.physicsBody.dynamic = NO;
    step.physicsBody.categoryBitMask = turtleCategory;
    step.physicsBody.collisionBitMask = stepCategory;
    
    [self.board addChild:step];
    
    self.currentStepY += 150;
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
