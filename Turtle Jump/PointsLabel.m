//
//  PointsLabel.m
//  Turtle Jump
//
//  Created by Sung Jin Kim on 5/24/17.
//  Copyright © 2017 SJ Kim, Brian Jang. All rights reserved.
//

#import "PointsLabel.h"

@implementation PointsLabel
+ (id)pointsLabelWithFontNamed:(NSString *)fontName {
    PointsLabel *pointsLabel = [PointsLabel labelNodeWithFontNamed:fontName];
    pointsLabel.name = @"pointsLabel";
    pointsLabel.text = @"0";
    pointsLabel.number = 0;
    
    return pointsLabel;
}

- (void)increment {
    self.number++;
    self.text = [NSString stringWithFormat:@"%i", self.number];
}
@end
