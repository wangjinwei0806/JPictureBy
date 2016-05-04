//
//  CusCollectionViewCell.h
//  PictureBy
//
//  Created by macbook on 16/5/3.
//  Copyright © 2016年 likejin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CusCollectionViewCell : UICollectionViewCell
/**
 *  文字
 */
@property (nonatomic,copy) NSString *title;
/**
 *  图片路径
 */
@property (nonatomic,copy)NSString *imageUrl;
@end
