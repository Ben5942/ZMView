//
//  ZMView.m
//  ZMView_Example
//
//  Created by 1 on 6.9.23.
//  Copyright © 2023 zyp. All rights reserved.
//

#import "ZMView.h"
#import "ZMCell.h"
#import "ZMCellImgV.h"

@implementation ZMView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(NSMutableArray *)imgArr{
    if (_imgArr == nil) {
        _imgArr = [NSMutableArray new];
    }
    return _imgArr;
}
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewFlowLayout*)flowLayout originView:(UIView*)originView placeHolderImage:(nonnull UIImage *)placeHolderImage{
    if (self = [super initWithFrame:frame collectionViewLayout:flowLayout]) {
        
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.pagingEnabled = YES;
        [self registerClass:[ZMCell class] forCellWithReuseIdentifier:@"ZMCell"];
        
        self.alwaysBounceHorizontal = YES;
        
        UIApplication *app = [UIApplication sharedApplication];
        CGRect startFrame = CGRectZero;
        if([app.delegate respondsToSelector:@selector(window)]){
             startFrame = [originView convertRect:originView.bounds toView:(UIView*)[app.delegate performSelector:@selector(window)]];
        }
        
        
        self.startFrame = startFrame;
        self.placeHolderImage = placeHolderImage;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = UIColor.blackColor;
    }
    return self;
}

-(void)showBigImgArrsInWindowWith:(NSMutableArray*)imageArrs andNowIndex:(NSInteger)imgIndex{
    
    UIApplication *app = [UIApplication sharedApplication];
    if([app.delegate respondsToSelector:@selector(window)]){
        [(UIView*)[app.delegate performSelector:@selector(window)] addSubview:self];
    }
    
    self.frame = self.startFrame;
    
//    [self reloadData];
    
    [UIView animateWithDuration:.2 animations:^{
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            self.imgArr = [NSMutableArray arrayWithArray:imageArrs];
            [self reloadData];
            [self layoutIfNeeded];
            [self scrollRectToVisible:CGRectMake(self.frame.size.width*imgIndex, 0, self.frame.size.width, self.frame.size.height) animated:NO];
        }
    } ];
    
}


#pragma mark - collectView代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imgArr.count>0?self.imgArr.count:1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZMCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZMCell" forIndexPath:indexPath];
    cell.placeHolderImage = self.placeHolderImage;
    [cell setImgObj:indexPath.row>=self.imgArr.count?@"":self.imgArr[indexPath.row]];
    __weak typeof(self) selfWeak = self;
    cell.imgBgV.imgTapBlock = ^{
        __strong typeof(self) selfStrong = selfWeak;
        selfStrong.imgArr = nil;
        [selfStrong reloadData];
        [UIView animateWithDuration:.2 animations:^{
            selfStrong.frame = selfStrong.startFrame;
        } completion:^(BOOL finished) {
            if (finished) {
                [selfStrong removeFromSuperview];
            }
        }];
    };
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
    
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

@end

