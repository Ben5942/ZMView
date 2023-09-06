//
//  ZMCell.m
//  ZMView_Example
//
//  Created by 1 on 6.9.23.
//  Copyright © 2023 zyp. All rights reserved.
//

#import "ZMCell.h"
#import "ZMCellImgV.h"

@implementation ZMCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgBgV = [[ZMCellImgV alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:self.imgBgV];
    }
    return self;
}

-(void)reset{
    [self.imgBgV reset];
}

-(void)setImgObj:(NSObject *)imgObj{
    _imgObj = imgObj;
    [self reset];
    [self.imgBgV showBigImg:_imgObj placeHolderImage:self.placeHolderImage];
}
@end
