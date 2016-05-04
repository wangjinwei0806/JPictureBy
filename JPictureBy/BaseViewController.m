//
//  BaseViewController.m
//  PictureBy
//
//  Created by macbook on 16/5/4.
//  Copyright © 2016年 likejin. All rights reserved.
//

#import "BaseViewController.h"
#import "CusCollectionViewCell.h"
#define  screenW  [UIScreen mainScreen].bounds.size.width
#define MaxSections 40
@interface BaseViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *datas;
@property (nonatomic,strong) NSTimer *timer;

@end

static  NSString * collectioncellID = @"collectioncellID";

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas =  @[@"1",@"2",@"3",@"4",@"5"];
    [self setupCollcetionView];
}
- (void)setupCollcetionView{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize =  CGSizeMake(screenW, 200);
    flowLayout.minimumInteritemSpacing =0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenW, 200) collectionViewLayout:flowLayout];
    collection.backgroundColor = [UIColor redColor];
    collection.delegate = self;
    collection.dataSource = self;
    collection.showsHorizontalScrollIndicator = NO;
    [collection setPagingEnabled:YES];
    [self.view addSubview:collection];
    [collection registerClass:[CusCollectionViewCell class] forCellWithReuseIdentifier:collectioncellID];
    self.collectionView = collection;
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:MaxSections/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    [self addTimer];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _datas.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return MaxSections;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CusCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:collectioncellID forIndexPath:indexPath];
    if (cell==nil) {
        cell = [[CusCollectionViewCell alloc] init];
    }
    cell.title = self.datas[indexPath.row];
    return cell;
}

- (void)addTimer{
    NSTimer  *timer=[NSTimer timerWithTimeInterval:1 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}
- (void)nextPage {
    
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:MaxSections/2];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger nextItem = currentIndexPathReset.item +1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem==self.datas.count) {
        nextItem=0;
        nextSection++;
    }
   // NSLog(@"%ld %ld",nextItem,nextSection);
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

@end
