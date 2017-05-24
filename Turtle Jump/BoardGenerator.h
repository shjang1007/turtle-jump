//
//  BoardGenerator.h
//  Turtle Jump
//
//  Created by Sung Jin Kim on 5/24/17.
//  Copyright © 2017 SJ Kim, Brian Jang. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BoardGenerator : SKNode

+ (id)generatorWithBoard:(SKNode *)board;
- (void)populate;
- (void)generate;

@end
