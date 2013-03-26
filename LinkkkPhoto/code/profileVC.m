//
//  profileVC.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-22.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "profileVC.h"
#import "TitleVC.h"

@interface ProfileVC ()

@end

@implementation ProfileVC

- (id)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newBtnPressed)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)newBtnPressed
{
    [self.navigationController pushViewController:[[TitleVC alloc] init] animated:YES];
}

@end
