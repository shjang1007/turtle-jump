//
//  Turtle.m
//  Turtle Jump
//
//  Created by Sung Jin Kim on 5/23/17.
//  Copyright © 2017 SJ Kim, Brian Jang. All rights reserved.
//

#import "Turtle.h"

@implementation Turtle
+ (id) turtle {
    Turtle *turtle = [Turtle spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(50, 50)];
    
    return turtle;
}
@end
