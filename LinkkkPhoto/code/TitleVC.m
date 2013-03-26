//
//  TitleVC.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-22.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "TitleVC.h"
#import "EditorVC.h"
#import "D_album.h"

@interface TitleVC () <UITextFieldDelegate>
{
    UITextField * _titleField;
}
@end

@implementation TitleVC

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"记录新经历";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(nextBtnPressed)];
        self.navigationItem.rightBarButtonItem.enabled = NO;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _titleField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 300, 50)];
    _titleField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _titleField.font = [UIFont systemFontOfSize:22];
    _titleField.placeholder = @"请取一个标题";
    _titleField.borderStyle = UITextBorderStyleRoundedRect;
//    _titleField.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:_titleField];
    [self.view addSubview:_titleField];
    [_titleField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)nextBtnPressed
{
    [self nextStep:_titleField.text];
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    if (textField.text.length > 0) {
//        [self nextStep];
//    }
//    return YES;
//}

-(void)nextStep:(NSString*)title
{
    D_album * album = [[D_album alloc] init];
    album.title = title;
    [self.navigationController pushViewController:[[EditorVC alloc]initWithAlbum:album] animated:YES];
}

- (void)textFieldDidChange :(NSNotification *)notif
{
    if (notif.object != _titleField)
        return;
    
    if ( _titleField.text.length > 0 )
        self.navigationItem.rightBarButtonItem.enabled = YES;
    else
        self.navigationItem.rightBarButtonItem.enabled = NO;
}

@end
