//
//  PieceEditorText.m
//  LinkkkPhoto
//
//  Created by andregao on 13-2-25.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import "PieceEditorText.h"
#import "D_textPiece.h"

@interface PieceEditorText()
{
    UITextView * _textEditor;
}
@end

@implementation PieceEditorText

- (id)init
{
    self = [super init];
    if (self) {
        _textEditor = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, 255, 130)];
        _textEditor.backgroundColor = [UIColor colorWithRed:(229/255.0) green:(229/255.0) blue:(229/255.0) alpha:1.0];
        _textEditor.font = [UIFont systemFontOfSize:20];
        [self addSubview:_textEditor];
    }
    return self;
}

-(void)editDone
{
    [_textEditor resignFirstResponder];
    D_textPiece * textPiece = (D_textPiece*)self.data;
    textPiece.text = _textEditor.text;
}

-(void)intoEdit
{
    [_textEditor becomeFirstResponder];
}

-(void)updateDisplay
{
    D_textPiece * textPiece = (D_textPiece*)self.data;
    _textEditor.text = textPiece.text;
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
