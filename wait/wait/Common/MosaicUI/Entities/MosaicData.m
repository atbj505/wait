//
//  MosaicModule.m
//  MosaicUI
//
//  Created by Ezequiel Becerra on 10/21/12.
//  Copyright (c) 2012 betzerra. All rights reserved.
//

#import "MosaicData.h"

@implementation MosaicData
@synthesize imageUrl, title, size, templetID, bigImageUrl;

-(id)initWithDictionary:(NSDictionary *)aDict{
    self = [self init];
    if (self){
        self.imageUrl = [aDict objectForKey:@"imageUrl"];
        self.title = [aDict objectForKey:@"name"];
        self.size = [[aDict objectForKey:@"size"] integerValue];
        self.templetID = [aDict objectForKey:@"templetID"];
        self.bigImageUrl = [aDict objectForKey:@"bigImageUrl"];
    }
    return self;
}

-(NSString *)description{
    NSString *retVal = [NSString stringWithFormat:@"%@ %@", [super description], self.title];
    return retVal;
}

@end
