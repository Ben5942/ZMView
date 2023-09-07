//
//  ZMView.h
//  ZMView_Example
//
//  Created by 1 on 6.9.23.
//  Copyright © 2023 zyp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
-(void)showBigImgArrsInWindowWith:(NSArray*)imageArrs andNowIndex:(NSInteger)imgIndex;
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewFlowLayout*)flowLayout originView:(UIView*)originView placeHolderImage:(UIImage*)placeHolderImage;
@property(assign,nonatomic)CGRect startFrame;
@property(copy,nonatomic)NSMutableArray *imgArr;
@property(strong,nonatomic)UIImage * placeHolderImage;
@end

NS_ASSUME_NONNULL_END
