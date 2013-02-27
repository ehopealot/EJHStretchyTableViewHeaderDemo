//
//  EJHViewController.m
//  StretchyTableViewHeaderDemo
//
//  Created by Erik Hope on 2/27/13.
//  Copyright (c) 2013 ehope. All rights reserved.
//

#import "EJHStretchyTableViewHeaderDemoViewController.h"

@interface EJHStretchyTableViewHeaderDemoViewController ()
@property (nonatomic, weak) UIImageView *imageView;
@end

static CGFloat const EJH_HEADER_HEIGHT = 200;

@implementation EJHStretchyTableViewHeaderDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, EJH_HEADER_HEIGHT)];
    UIImage *image = [UIImage imageNamed:@"sky-mountain-range"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    headerView.clipsToBounds = NO;
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [headerView addSubview:imageView];
    imageView.frame = headerView.bounds;
    self.imageView = imageView;
    [self.tableView addSubview:headerView];
    self.tableView.tableHeaderView = headerView;
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}


// Here is where the good stuff happens
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0){
        CGRect imageViewFrame = self.imageView.frame;
        imageViewFrame.origin.y = MAX(MIN(0, scrollView.contentOffset.y), -(self.imageView.image.size.height - EJH_HEADER_HEIGHT));
        imageViewFrame.size.height = EJH_HEADER_HEIGHT - imageViewFrame.origin.y;
        self.imageView.frame = imageViewFrame;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
