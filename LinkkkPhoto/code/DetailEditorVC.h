//
//  DetailEditorVC.h
//  LinkkkPhoto
//
//  Created by andregao on 13-2-23.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "D_album.h"
#import "EditorVC.h"

@interface DetailEditorVC : UIViewController
@property(nonatomic,assign) EditorVC * editorVC;
- (id)initWithAlbum:(D_album*)album;
- (void)showPieceByIndex:(int)index bEdit:(BOOL)bEdit;
@end
