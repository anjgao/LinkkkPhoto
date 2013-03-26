//
//  DetailEditorVC.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-23.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "DetailEditorVC.h"
#import "pieceEditorBase.h"
#import "D_album.h"
#import "PieceEditorTitle.h"
#import "D_textPiece.h"
#import "PieceEditorText.h"
#import "D_picPiece.h"
#import "PieceEditorPic.h"

@interface DetailEditorVC ()
{
    UIScrollView * _bgSV;
    D_album * _album;
    NSMutableArray * _pieceViewList;    // PieceEditorBase *
}
@end

@implementation DetailEditorVC

- (id)initWithAlbum:(D_album*)album
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backBtnPressed)];
        _album = album;
        _pieceViewList = [NSMutableArray arrayWithCapacity:12];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:(229/255.0) green:(229/255.0) blue:(229/255.0) alpha:1.0];
    
    _bgSV = [[UIScrollView alloc] initWithFrame:CGRectMake(15, 0, 290, self.view.bounds.size.height)];
    _bgSV.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _bgSV.clipsToBounds = NO;
    _bgSV.pagingEnabled = YES;
    _bgSV.alwaysBounceHorizontal = YES;
    _bgSV.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_bgSV];
    
    [self addTitlePiece];
    [self addPiece2ScrollView];
}

- (void)addTitlePiece
{
    int curX = 3;
    PieceEditorTitle * pieceV = [[PieceEditorTitle alloc] init];
    CGRect f = pieceV.frame;
    f.origin.x = curX;
    f.origin.y = 10;
    pieceV.frame = f;
    [_bgSV addSubview:pieceV];
    [_pieceViewList addObject:pieceV];
    pieceV.data = _album;
    [pieceV updateDisplay];
}

- (void)addPiece2ScrollView
{
    int curX = 3 + _pieceViewList.count*290;
    for (D_piece * piece in _album.pieceList) {
        PieceEditorBase * pieceV = [self createPiece:piece];
        CGRect f = pieceV.frame;
        f.origin.x = curX;
        f.origin.y = 10;
        pieceV.frame = f;
        [_bgSV addSubview:pieceV];
        [_pieceViewList addObject:pieceV];
        curX += 290;
    }
    _bgSV.contentSize = CGSizeMake(curX, 405);
}

- (PieceEditorBase*)createPiece:(D_piece*)piece
{
    PieceEditorBase * pe = nil;
    if ([piece isKindOfClass:[D_textPiece class]])
        pe = [[PieceEditorText alloc] init];
    else if([piece isKindOfClass:[D_picPiece class]])
        pe = [[PieceEditorPic alloc] init];
    else
        pe = [[PieceEditorBase alloc] init];
    
    pe.data = piece;
    [pe updateDisplay];

    return pe;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backBtnPressed
{
    [_editorVC updateThumbData];
    [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
}

- (void)showPieceByIndex:(int)index bEdit:(BOOL)bEdit
{
    _bgSV.contentOffset = CGPointMake(3+290*index, 0);
    if (bEdit) {
        [[self curPiece] intoEdit];
    }
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    _bgSV.scrollEnabled = NO;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(doneBtnPressed)];
}

- (void)doneBtnPressed
{
    [self editDone];
    _bgSV.scrollEnabled = YES;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backBtnPressed)];    
    self.navigationItem.rightBarButtonItem = nil;
}

-(void)editDone
{
    PieceEditorBase * editor = [self curPiece];
    [editor editDone];
}

-(PieceEditorBase*)curPiece
{
    CGFloat pageWidth = _bgSV.frame.size.width;
    int page = floor((_bgSV.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    return _pieceViewList[page];
}

@end
