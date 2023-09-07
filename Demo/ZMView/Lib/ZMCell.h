//
//  ZMCell.h
//  ZMView_Example
//
//  Created by 1 on 6.9.23.
//  Copyright © 2023 zyp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ZMCellImgV;
NS_ASSUME_NONNULL_BEGIN

@interface ZMCell : UICollectionViewCell
@property(strong,nonatomic)ZMCellImgV *imgBgV;
@property(strong,nonatomic)NSObject * imgObj;

@property(strong,nonatomic)UIImage * placeHolderImage;
-(void)reset;
@end

NS_ASSUME_NONNULL_END
