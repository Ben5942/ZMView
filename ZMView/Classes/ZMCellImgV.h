//
//  ZMCellImgV.h
//  ZMView_Example
//
//  Created by 1 on 6.9.23.
//  Copyright © 2023 zyp. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface ZMCellImgV : UIScrollView<UIScrollViewDelegate,UIGestureRecognizerDelegate>
-(void)showBigImgInWindowWith:(NSObject*)imageObj;
-(instancetype)initWithFrame:(CGRect)frame originView:(UIView*)originView;
@property(assign,nonatomic)CGRect startFrame;
@property(strong,nonatomic)UIImageView * imgV;
-(void)showBigImg:(NSObject*)imageObj placeHolderImage:(UIImage*)placeHolderImage;
-(void)reset;
@property(copy,nonatomic)void(^imgTapBlock)();
@end

NS_ASSUME_NONNULL_END
