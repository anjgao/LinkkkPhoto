//
//  pieceEditorBase.h
//  LinkkkPhoto
//
//  Created by andregao on 13-2-23.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "D_piece.h"

@interface PieceEditorBase : UIView
@property(nonatomic,assign) id data;
-(void)intoEdit;
-(void)editDone;
-(void)updateDisplay;
@end
