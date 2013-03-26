//
//  pieceEditorBase.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-23.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "pieceEditorBase.h"

@implementation PieceEditorBase

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 10, 284, 395)];
    if (self) {
        // todo 全局资源
        UIImage * bg = [UIImage imageNamed:@"piece_bg"];
        UIImage * sbg = [bg stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        UIImageView * bgV = [[UIImageView alloc] initWithFrame:self.bounds];
        bgV.image = sbg;
        [self addSubview:bgV];
    }
    return self;
}

-(void)intoEdit
{
    
}

-(void)editDone
{
    
}

-(void)updateDisplay
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
