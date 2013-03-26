//
//  EditorVC.h
//  LinkkkPhoto
//
//  Created by andregao on 13-2-22.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "D_album.h"

@interface EditorVC : UIViewController
- (id)initWithAlbum:(D_album*)album;
- (void)updateThumbData;
@end
