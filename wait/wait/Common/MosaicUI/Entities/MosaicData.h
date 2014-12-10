//
//  MosaicModule.h
//  MosaicUI
//
//  Created by Ezequiel Becerra on 10/21/12.
//  Copyright (c) 2012 betzerra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MosaicData : NSObject{
    NSString *imageUrl;
    NSString *title;
    NSInteger size;
    NSString *templetID;
    NSString *bigImageUrl;
}

-(id)initWithDictionary:(NSDictionary *)aDict;

@property (strong) NSString *imageUrl;
@property (strong) NSString *title;
@property (readwrite) NSInteger size;
@property (nonatomic, strong)NSString *templetID;
@property (nonatomic, strong)NSString *bigImageUrl;
@end
