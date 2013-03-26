//
//  PieceEditorTitle.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-25.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "PieceEditorTitle.h"
#import "D_album.h"

@interface PieceEditorTitle()
{
    UILabel * _titleL;
}
@end

@implementation PieceEditorTitle
//{
//    UILabel * _titleL;
//}

- (id)init
{
    self = [super init];
    if (self) {
        _titleL = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 10, 20)];
        _titleL.textAlignment = NSTextAlignmentCenter;
        _titleL.numberOfLines = 0;
        _titleL.textColor = [UIColor grayColor];
        _titleL.font = [UIFont systemFontOfSize:34];
        [self addSubview:_titleL];
    }
    return self;
}

-(void)updateDisplay
{
    D_album * album = (D_album*)self.data;
    _titleL.text = album.title;
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
