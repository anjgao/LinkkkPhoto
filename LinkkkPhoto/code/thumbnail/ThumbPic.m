//
//  ThumbPic.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-26.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "ThumbPic.h"
#import "D_picPiece.h"

@interface ThumbPic()
{
    UIImageView * _imgView;
}
@end

@implementation ThumbPic

- (id)init
{
    self = [super init];
    if (self) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10,8,78,102)];
        [self addSubview:_imgView];
    }
    return self;
}

-(void)updateDisplay
{
    D_picPiece * picPiece = (D_picPiece*)self.data;
    _imgView.image = picPiece.pic;
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
