//
//  CusCollectionViewCell.m
//  PictureBy
//
//  Created by macbook on 16/5/3.
//  Copyright © 2016年 likejin. All rights reserved.
//

#import "CusCollectionViewCell.h"

@interface CusCollectionViewCell ()
@property (nonatomic,weak) UILabel *lable;
@end
@implementation CusCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        
        UILabel *lable =[[UILabel alloc] init];
        CGFloat wsw =[UIScreen mainScreen].bounds.size.width;
        lable.center = CGPointMake(wsw/2, 100);
        lable.bounds = CGRectMake(0, 0, 50, 50);
        [self.contentView addSubview:lable];
        _lable = lable;
    }
    return self;
}
-(void)setTitle:(NSString *)title{
    _title=title;
    self.lable.text = title;
}
@end
