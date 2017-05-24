//
//  Turtle.h
//  Turtle Jump
//
//  Created by Sung Jin Kim on 5/23/17.
//  Copyright © 2017 SJ Kim, Brian Jang. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Turtle : SKSpriteNode

+ (id)turtle;
- (void)moveRight;
- (void)jump;
- (void)start;

@end
