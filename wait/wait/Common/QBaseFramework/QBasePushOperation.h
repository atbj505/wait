//
//  QBasePushOperation.h
//  QBaseFrameworkDemo
//
//  Created by andy on 11/8/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseNetOperation.h"
#import "QBasePushPacket.h"

@interface QBasePushOperation : QBaseNetOperation

@property (nonatomic, assign) BOOL isPushFuture;
@property (nonatomic, strong) QBasePushPacket *pushPacket;

@end
