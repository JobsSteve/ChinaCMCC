//
//  MenuTabbarView.h
//  FFAdemo
//
//  Created by love_ping891122 on 14/12/8.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  MenuTabbarViewDelegate<NSObject>

-(void)getinfo:(int)index;

@end


@interface MenuTabbarView : UIView
{
    JSBadgeView *badgeView;

}
@property(nonatomic,retain)UIButton *MenuButton;
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,retain)NSArray   *iconsList_normal;
@property(nonatomic,retain)NSArray   *iconsList_selected;

@property(nonatomic,retain)NSArray   *titlesList;
@property(nonatomic,retain)id <MenuTabbarViewDelegate>delegate;
@property(nonatomic,retain)JSBadgeView *badgeView;

-(void)reloadMenuView;



@end
