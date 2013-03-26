//
//  PieceEditorPic.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-26.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "PieceEditorPic.h"
#import "D_picPiece.h"

@interface PieceEditorPic()
{
    UIImageView * _imgView;
}
@end


@implementation PieceEditorPic

- (id)init
{
    self = [super init];
    if (self) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 252, 320)];
        [self addSubview:_imgView];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(15, 330, 252, 20);
        [btn addTarget:self action:@selector(recordBtnDown) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(recordBtnUp) forControlEvents:UIControlEventTouchDragInside];
        [self addSubview:btn];
    }
    return self;
}

-(void)updateDisplay
{
    D_picPiece * picPiece = (D_picPiece*)self.data;
    _imgView.image = picPiece.pic;
}

-(void)recordBtnDown
{
    
}

-(void)recordBtnUp
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
