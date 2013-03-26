//
//  D_album.h
//  LinkkkPhoto
//
//  Created by andregao on 13-2-23.
//  Copyright (c) 2013年 linkkk.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "D_piece.h"

@interface D_album : NSObject
@property(nonatomic,retain) NSString * title;
@property(nonatomic,retain) NSMutableArray * pieceList;     // D_piece
@end
