//
//  ZMViewController.m
//  ZMView
//
//  Created by zyp on 09/06/2023.
//  Copyright (c) 2023 zyp. All rights reserved.
//

#import "ZMViewController.h"
#import "ZMView.h"

@interface ZMViewController ()

@end

@implementation ZMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapDemo1Img:(id)sender {
    ZMView *imgV = [[ZMView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new] originView:((UITapGestureRecognizer*)sender).view placeHolderImage:nil];
    [imgV showBigImgArrsInWindowWith:@[[UIImage imageNamed:@"demo1"],[UIImage imageNamed:@"demo2"]] andNowIndex:0];
//    [imgV showBigImgArrsInWindowWith:@[
//        @"https://www.baidu.com?imgid=sadasczxcasadas&sign=asdaskey",
//     @"https://www.baidu.com?imgid=sadasczxcasadas&sign=asdaskey"
//    ] andNowIndex:0];
}


- (IBAction)tapDemo2Img:(id)sender {
    ZMView *imgV = [[ZMView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new] originView:((UITapGestureRecognizer*)sender).view placeHolderImage:nil];
    [imgV showBigImgArrsInWindowWith:@[[UIImage imageNamed:@"demo1"],[UIImage imageNamed:@"demo2"]] andNowIndex:1];
//    [imgV showBigImgArrsInWindowWith:@[
//        @"https://www.baidu.com?imgid=sadasczxcasadas&sign=asdaskey",
//     @"https://www.baidu.com?imgid=sadasczxcasadas&sign=asdaskey"
//    ] andNowIndex:0];
}




@end
