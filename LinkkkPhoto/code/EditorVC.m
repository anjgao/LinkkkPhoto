//
//  EditorVC.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-22.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "EditorVC.h"
#import "ThumbBase.h"
#import "D_album.h"
#import "DetailEditorVC.h"
#import "ThumbTitle.h"
#import "D_textPiece.h"
#import "ThumbText.h"
#import "D_picPiece.h"
#import "ThumbPic.h"

@interface EditorVC () <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIScrollView * _bgSV;
    D_album * _album;
    NSMutableArray * _thumbs;
}
@end

@implementation EditorVC

- (id)initWithAlbum:(D_album*)album
{
    self = [super init];
    if (self) {
        self.title = @"编辑经历";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(nextBtnPressed)];

        UIBarButtonItem * flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem * addBtn = [[UIBarButtonItem alloc] initWithTitle:@"                 添加碎片                 " style:UIBarButtonItemStyleDone target:self action:@selector(addBtnPressed)];
        self.toolbarItems = @[flexItem,addBtn,flexItem];
        
        _album = album;
        
        _thumbs = [NSMutableArray arrayWithCapacity:12];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _bgSV = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _bgSV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _bgSV.backgroundColor = [UIColor colorWithRed:(229/255.0) green:(229/255.0) blue:(229/255.0) alpha:1.0];
    _bgSV.alwaysBounceVertical = YES;
    [self.view addSubview:_bgSV];
    
    [self addTitleThumb];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addDataFromAlbum
{
    // title
    
}

-(void)nextBtnPressed
{
    
}

-(void)addBtnPressed
{
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:@"添加哪种元素" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil
                                               otherButtonTitles:@"拍照",@"从相册选取图片",@"文字",nil];
    [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self takePhoto];
            break;
        case 1:
            [self selectPhoto];
            break;
        case 2:
            [self addText];
            break;
        default:
            break;
    }
}

-(void)takePhoto
{
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)selectPhoto
{
    D_piece * piece = [self createPieceData:[D_piece class]];
    [self addThumbCls:[ThumbBase class] data:piece];
}

-(void)addText
{
    int index = _thumbs.count;
    D_piece * piece = [self createPieceData:[D_textPiece class]];
    [self addThumbCls:[ThumbText class] data:piece];
//    [self showDetailEditor:index];
    [self performSelector:@selector(intoTextEdit:) withObject:[NSNumber numberWithInt:index] afterDelay:0];
}

-(void)addTitleThumb
{
    ThumbTitle * thumbTitle = (ThumbTitle*)[self addThumbCls:[ThumbTitle class] data:_album];
    [thumbTitle updateDisplay];
}

-(void)addPicThumb:(UIImage*)img
{
    D_picPiece * picPiece = (D_picPiece*)[self createPieceData:[D_picPiece class]];
    picPiece.pic = img;
    [self addThumbCls:[ThumbPic class] data:picPiece];
}

-(D_piece*)createPieceData:(Class)dataCls
{
    D_piece * piece;
    if (dataCls) {
        piece = [[dataCls alloc] init];
        [_album.pieceList addObject:piece];
    }
    return piece;
}

-(ThumbBase*)addThumbCls:(Class)thumbCls data:(id)data
{    
    ThumbBase * thumb = [[thumbCls alloc] init];
    thumb.data = data;
    int index = _thumbs.count;
    int bottom = [self setPosByIndex:index thumb:thumb];
    [_thumbs addObject:thumb];
    [_bgSV addSubview:thumb];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(thumbTap:)];
    [thumb addGestureRecognizer:tap];
    
    bottom += 6;
    CGSize viewSize = self.view.bounds.size;
    if (bottom > viewSize.height) {
        viewSize.height = bottom;
        _bgSV.contentSize = viewSize;
        [_bgSV setContentOffset:CGPointMake(0, bottom-self.view.bounds.size.height) animated:YES];
    }
    
    [thumb updateDisplay];
    
    return thumb;
}

-(int)setPosByIndex:(int)index thumb:(ThumbBase*)thumb
{
    int line = index / 3;
    int col = index % 3;
    
    int x = 7 + col*(98+6);
    int y = 6 + line*(120+6);
    
    CGRect f = thumb.frame;
    f.origin.x = x;
    f.origin.y = y;
    thumb.frame = f;
    
    return f.origin.y + f.size.height;
}

-(void)thumbTap:(UITapGestureRecognizer*)tap
{
    [self showDetailEditor:[_thumbs indexOfObject:tap.view] bEdit:NO];
}

-(void)showDetailEditor:(int)index bEdit:(BOOL)bEdit
{
    DetailEditorVC * de = [[DetailEditorVC alloc] initWithAlbum:_album];
    de.editorVC = self;
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:de];
    [self presentViewController:nav animated:NO completion:nil];
    [de showPieceByIndex:index bEdit:bEdit];
}

- (void)updateThumbData
{
    for (ThumbBase* thumb in _thumbs) {
        [thumb updateDisplay];
    }
}

- (void)intoTextEdit:(NSNumber*)index
{
    [self showDetailEditor:index.intValue bEdit:YES];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage * img = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self addPicThumb:img];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
