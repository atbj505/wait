//
//  QBasePushOperation.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/8/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBasePushOperation.h"

@implementation QBasePushOperation

- (void)configOperation
{
    self.url = @"http://42.62.8.172:3453/api/v0.1.0/push";

    self.method = @"POST";
    
    self.isArchiveCache = NO;
    self.isDatabaseCache = NO;
}

- (void)setIsPushFuture:(BOOL)isPushFuture
{
    _isPushFuture = isPushFuture;
    
    if (_isPushFuture) {
        self.url = @"http://42.62.8.172:3452/api/v0.1.0/tasks";
        self.params = [_pushPacket dictionarySendFuture];
    }else {
        self.url = @"http://42.62.8.172:3453/api/v0.1.0/push";
        self.params = [_pushPacket dictionarySendNow];
    }
}

#pragma mark -
#pragma mark 重写Start函数

- (void)start
{
    NSMutableURLRequest *request =
    [[AFHTTPRequestSerializer serializer] requestWithMethod:self.method
                                                  URLString:self.url
                                                 parameters:self.params
                                                      error:nil];

    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

        [self requestComplete:responseObject error:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self requestComplete:nil error:error];
    }];
    
    [op start];
}

@end
