//
//  GameScene.m
//  Turtle Jump
//
//  Created by Sung Jin Kim on 5/23/17.
//  Copyright © 2017 SJ Kim, Brian Jang. All rights reserved.
//

#import "GameScene.h"
#import "Turtle.h"
#import "BoardGenerator.h"
#import "PointsLabel.h"

@interface GameScene()
@property BOOL isStarted;
@property BOOL isGameOver;
@end

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
    
    Turtle *turtle;
    SKNode *board;
    BoardGenerator *generator;
    
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    self.anchorPoint = CGPointMake(0.5, 0.5);
    
    
    board = [SKNode node];
    [self addChild:board];
    
    generator = [BoardGenerator generatorWithBoard:board];
    [self addChild:generator];
    [generator populate];
    
    turtle = [Turtle turtle];
    turtle.position = CGPointMake(0, 420 + turtle.frame.size.height / 2);
    [board addChild:turtle];
    
    
    PointsLabel *pointsLabel = [PointsLabel pointsLabelWithFontNamed:@"Avenir"];
    pointsLabel.position = CGPointMake(0, self.frame.size.height / 2 - pointsLabel.fontSize);
    [self addChild:pointsLabel];
    
    
    // Get label node from scene and store it for use later
//    _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
    
//    _label.alpha = 0.0;
//    [_label runAction:[SKAction fadeInWithDuration:2.0]];
    
    CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    // Create shape node to use during mouse interaction
    _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
    _spinnyNode.lineWidth = 2.5;
    
    [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
    [_spinnyNode runAction:[SKAction sequence:@[
                                                [SKAction waitForDuration:0.5],
                                                [SKAction fadeOutWithDuration:0.5],
                                                [SKAction removeFromParent],
                                                ]]];
}

- (void)start {
    self.isStarted = YES;
    [turtle start];
}

- (void)clear {
    
}

- (void)gameOver {
    
}

- (void)didSimulatePhysics {
    [self centerOnNode:turtle];
    
    [self handleGeneration];
    [self handleCleanup];
}

- (void)handleGeneration {
    [board enumerateChildNodesWithName:@"step" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < turtle.position.y) {
            node.name = @"step_cancelled";
            [generator generate];
        }
    }];
}

- (void) handleCleanup {
    [board enumerateChildNodesWithName:@"step" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < turtle.position.y - self.frame.size.height / 2 - node.frame.size.height / 2) {
            [node removeFromParent];
        }
    }];
}

- (void)centerOnNode:(SKNode *)node {
    CGPoint positionInScene = [self convertPoint:node.position fromNode:node.parent];
    board.position = CGPointMake(board.position.x, board.position.y - positionInScene.y);
}

- (void)touchDownAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor greenColor];
    [self addChild:n];
}

- (void)touchMovedToPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor blueColor];
    [self addChild:n];
}

- (void)touchUpAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor redColor];
    [self addChild:n];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
//    [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
//    
//    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
    
    if (!self.isStarted) {
        [self start];
    } else if (self.isGameOver) {
        [self clear];
    }
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
