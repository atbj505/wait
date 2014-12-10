//
//  QBasePushPacket.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/8/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBasePushPacket.h"
#import "GTMBase64.h"
@interface NSMutableDictionary(SafeMethod)
- (void)saveSetObject:(id)objc forKey:(NSString *)key;
@end
@implementation NSMutableDictionary (SafeMethod)
- (void)saveSetObject:(id)objc forKey:(NSString *)key
{
    if (objc) {
        [self setObject:objc forKey:key];
    }
}
@end

@implementation QBasePushPacket

- (instancetype)init
{
    if (self = [super init]) {
        
        _params = [NSMutableDictionary dictionary];
    }
    
    return self;
}


- (NSDictionary *)dictionarySendNow
{
    [_params saveSetObject:_token forKey:@"token"];
    [_params saveSetObject:_alert forKey:@"alert"];
    [_params saveSetObject:_badge forKey:@"badge"];
    [_params saveSetObject:[_payload JSONString] forKey:@"payload"];

    return _params;
}

- (NSDictionary *)dictionarySendFuture
{
    NSData *data = [[self dictionarySendNow] JSONData];
    NSString *dataStr = [GTMBase64 stringByEncodingData:data];
    
    [_params removeAllObjects];
    [_params saveSetObject:dataStr forKey:@"data"];
    [_params saveSetObject:_time forKey:@"time"];
    [_params saveSetObject:_desc forKey:@"desc"];
    [_params saveSetObject:_callback_url forKey:@"callback_url"];

    return _params;
}

@end
