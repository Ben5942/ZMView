//
//  ZMCellImgV.m
//  ZMView_Example
//
//  Created by 1 on 6.9.23.
//  Copyright © 2023 zyp. All rights reserved.
//

#import "ZMCellImgV.h"
#import <UIImageView+WebCache.h>

@implementation ZMCellImgV
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark - 多张图片
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.bounces = YES;
        self.bouncesZoom = YES;
        [self setMinimumZoomScale:0.01];
        [self setMaximumZoomScale:2];
        self.delegate = self;
        self.backgroundColor = UIColor.blackColor ;
        self.imgV = [UIImageView new];
        self.imgV.contentMode = UIViewContentModeScaleAspectFit;
        _imgV.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDismissView)];
        [self.imgV addGestureRecognizer:ges];
        [self addSubview:self.imgV];
        
        self.userInteractionEnabled = YES;
    }
    return self;
}
-(void)tapDismissView{
    if (self.imgTapBlock) self.imgTapBlock();
}
-(void)reset{
    self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    self.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height+1);
    self.imgV.frame = self.bounds;
    
    self.imgV.image = nil;
}
-(void)showBigImg:(NSObject *)imageObj placeHolderImage:(nonnull UIImage *)placeHolderImage{
    if ([imageObj isKindOfClass:[NSString class]]&&[(NSString*)imageObj containsString:@"http"]) {
        [self.imgV sd_setImageWithURL:[NSURL URLWithString:(NSString*)imageObj] placeholderImage:placeHolderImage];
    }else if([imageObj isKindOfClass:[UIImage class]]){
        [self.imgV setImage:(UIImage*)imageObj];
    }
    
    self.imgV.frame =self.bounds;
}



#pragma mark - 单张图片
-(instancetype)initWithFrame:(CGRect)frame originView:(UIView*)originView{
    if (self= [super initWithFrame:frame]) {
        self.bounces = YES;
        self.bouncesZoom = YES;
        [self setMinimumZoomScale:0.01];
        [self setMaximumZoomScale:2];
        self.delegate = self;
        
        
        UIApplication *app = [UIApplication sharedApplication];
        CGRect startFrame = CGRectZero;
        if([app.delegate respondsToSelector:@selector(window)]){
            CGRect startFrame = [originView convertRect:originView.bounds toView:[app.delegate performSelector:@selector(window)] ];
        }
        
        self.startFrame = startFrame;
        
        
        self.backgroundColor = UIColor.blackColor ;
        self.imgV = [UIImageView new];
        self.imgV.contentMode = UIViewContentModeScaleAspectFit;
        _imgV.userInteractionEnabled = YES;
        [self addSubview:self.imgV];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self.imgV addGestureRecognizer:ges];
    }
    return self;
}

-(void)showBigImgInWindowWith:(NSObject *)imageObj {
    
    UIApplication *app = [UIApplication sharedApplication];
    if([app.delegate respondsToSelector:@selector(window)]){
        [(UIView*)[app.delegate performSelector:@selector(window)] addSubview:self];
    }
    
    if ([imageObj isKindOfClass:[NSString class]]&&[(NSString*)imageObj containsString:@"http"]) {
        [self.imgV sd_setImageWithURL:[NSURL URLWithString:(NSString*)imageObj]];
    }else if([imageObj isKindOfClass:[UIImage class]]){
        [self.imgV setImage:(UIImage*)imageObj];
    }
    self.frame = self.startFrame;
    self.imgV.frame = CGRectMake(0, 0, self.startFrame.size.width, self.startFrame.size.height);
    
    [UIView animateWithDuration:.38 animations:^{
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        self.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, UIViewAutoresizingFlexibleHeight+1);
        self.imgV.frame = self.bounds;
    }];
    
}
-(void)tap{
    [UIView animateWithDuration:.38 animations:^{
        self.frame = self.startFrame;
        self.imgV.frame = self.bounds;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imgV;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    
    [UIView animateWithDuration:.38 animations:^{
        self->_imgV.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-1);
    }];
    NSLog(@"缩放比例:%f",scale);
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    self.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height+1);
    _imgV.center = self.center;
    NSLog(@"缩放中的调用~");
}


@end
