//
//  JXAddressBookModel.h
//  JXAdressBookDemo
//
//  Created by andy on 10/25/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface JXAddressBookModel :JSONModel{
@public
    //  是否点击
    BOOL _isClick;
}

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *userIconPath;
@property (nonatomic, copy) NSString *photoNumber;
@property (nonatomic, copy) NSString *receiveID;
@property (nonatomic, copy) NSString *token;

@end
