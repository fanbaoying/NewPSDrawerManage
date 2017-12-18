//
//  LeftView.m
//  PSDrawerController
//
//  Created by 雷亮 on 16/8/8.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "LeftView.h"
#import "PSDrawerManager.h"
#import "UIView+leoAdd.h"

static NSString *const reUse = @"reUse";

#define kBackgroundColor [UIColor colorWithRed:13.f / 255.f green:184.f / 255.f blue:246.f / 255.f alpha:1]

@interface LeftView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <NSArray *>*dataArray;
@property (nonatomic, strong) UIImageView *imageView;

@property (strong, nonatomic) UIView *headerView;

@end

@implementation LeftView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = kBackgroundColor;
        
        self.dataArray = @[@[[UIImage imageNamed:@"sidebar_business_1"], @"订单记录"],
                           @[[UIImage imageNamed:@"sidebar_purse_1"], @"我的钱包"],
                           @[[UIImage imageNamed:@"sidebar_decoration_1"], @"收件信箱"],
//                           sidebar_decoration_1
                           @[[UIImage imageNamed:@"sidebar_favorit_1"], @"邀请有奖"],
                           @[[UIImage imageNamed:@"sidebar_album_1"], @"我的司机"],
                           @[[UIImage imageNamed:@"sidebar_file_1"], @"客服中心"],
                           @[[UIImage imageNamed:@"sidebar_setting_1"], @"更多设置"]];
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        [self addSubview:_tableView];
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return self;
}

#pragma mark -
#pragma mark - tableView procotol methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUse];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor darkGrayColor];
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, 44)];
        selectedBackgroundView.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = selectedBackgroundView;
    }
    cell.imageView.image = self.dataArray[indexPath.row][0];
    cell.textLabel.text = self.dataArray[indexPath.row][1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 显示中间控制器
    [[PSDrawerManager instance] resetShowType:PSDrawerManagerShowCenter];
}

#pragma mark -
#pragma mark - headerView
//- (UIImageView *)imageView {
//    if (!_imageView) {
//        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, 280)];
//        _imageView.contentMode = UIViewContentModeScaleAspectFill;
////        _imageView.image = [UIImage imageNamed:@"sidebar_bg"];
//        _imageView.clipsToBounds = YES;
//
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
//        imageView.size = CGSizeMake(60, 60);
//        imageView.left = 25;
//        imageView.top = 64;
//        imageView.clipsToBounds = YES;
//        imageView.layer.cornerRadius = imageView.width / 2;
//        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
//        imageView.layer.borderWidth = 2.f;
//        [_imageView addSubview:imageView];
//
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right + 30, imageView.top + 10, 100, 20)];
//        label.textColor = [UIColor darkGrayColor];
//        label.font = [UIFont boldSystemFontOfSize:20];
//        label.text = @"leiliang";
//        [_imageView addSubview:label];
//    }
//    return _imageView;
//}

- (UIView *)headerView {
    
    if (!_headerView) {
        
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 200)];
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headerImg"]];
        imageView.size = CGSizeMake(60, 60);
        imageView.left = self.width*3/8-30;
        imageView.top = 64;
//        imageView.clipsToBounds = YES;
//        imageView.layer.cornerRadius = imageView.width / 2;
//        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
//        imageView.layer.borderWidth = 2.f;
        [_headerView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.top + 70, self.width*3/4, 20)];
        label.textColor = [UIColor darkGrayColor];
        label.font = [UIFont boldSystemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"136****8181";
        [_headerView addSubview:label];
        
    }
    
    return _headerView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
