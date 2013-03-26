//
//  ThumbText.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-25.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "ThumbText.h"
#import "D_textPiece.h"

@interface ThumbText()
{
    UILabel * _textLabel;
}
@end

@implementation ThumbText

- (id)init
{
    self = [super init];
    if (self) {
        _textLabel = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 10, 10)];
        _textLabel.numberOfLines = 0;
        _textLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:_textLabel];
    }
    return self;
}

-(void)setText:(NSString *)text
{
    CGRect maxSize = CGRectInset(self.bounds, 10, 10);
    _textLabel.frame = maxSize;
    _textLabel.text = text;
    [_textLabel sizeToFit];
    if (_textLabel.bounds.size.height > maxSize.size.height) {
        _textLabel.frame = maxSize;
    }
}

-(void)updateDisplay
{
    D_textPiece * textPiece = (D_textPiece*)self.data;
    [self setText:textPiece.text];
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
