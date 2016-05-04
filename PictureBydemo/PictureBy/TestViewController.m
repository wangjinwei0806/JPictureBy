//
//  TestViewController.m
//  PictureBy
//
//  Created by macbook on 16/5/4.
//  Copyright © 2016年 likejin. All rights reserved.
//

#import "TestViewController.h"
//#import "BaseCollectionView.h"
#define  screenW  [UIScreen mainScreen].bounds.size.width
#define MaxSections 40

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    
//        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
//        flowLayout.itemSize =  CGSizeMake(screenW, 200);
//        flowLayout.minimumInteritemSpacing =0;
//        flowLayout.minimumLineSpacing = 0;
//        flowLayout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
//    BaseCollectionView *base=[[BaseCollectionView alloc] initWithFrame:CGRectMake(0, 0, screenW, 200) collectionViewLayout:flowLayout];
//      base.datas =  @[@"1",@"2",@"3",@"4",@"5"];
//    [self.view addSubview:base];
//     [base scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:MaxSections/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//    [base addTimer];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
