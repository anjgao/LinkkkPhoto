//
//  ThumbTitle.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-25.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "ThumbTitle.h"
#import "D_album.h"

@interface ThumbTitle()
{
    UILabel * _titleL;
}
@end

@implementation ThumbTitle

- (id)init
{
    self = [super init];
    if (self) {
        _titleL = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 10, 10)];
        _titleL.textAlignment = NSTextAlignmentCenter;
        _titleL.numberOfLines = 0;
        _titleL.textColor = [UIColor grayColor];
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
