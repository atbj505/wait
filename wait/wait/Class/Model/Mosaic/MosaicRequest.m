//
//  MosaicRequest.m
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "MosaicRequest.h"

@implementation MosaicRequest
/**
 *  Mosaic网络请求
 */
-(NSData*)urlRequestWith:(NSString*)catelogID{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *urlStr = [dic objectForKey:@"templet"];
    urlStr = [urlStr stringByAppendingFormat:@"&catalogID=%@",catelogID];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (data) {
        //[self jsonParserWith:data];
        [[NSUserDefaults standardUserDefaults]setValue:data forKey:catelogID];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }else{
        NSData *mosaicData = [[NSUserDefaults standardUserDefaults]valueForKey:catelogID];
        if (mosaicData) {
            //[self jsonParserWith:mosaicData];
        }else{
            return nil;
        }
    }
    return data;
}
/**
 *  JSON解析
 */
-(NSMutableArray*)jsonParserWith:(NSData*)data{
    NSMutableArray *templateArr = [NSMutableArray array];
    NSDictionary *JsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *arr = [JsonDic objectForKey:@"templetsList"];
    for (NSDictionary *dic in arr) {
        TempletModel *mytemplateDetail = [[TempletModel alloc]initWithDictionary:dic error:nil];
        [templateArr addObject:mytemplateDetail];
    }
    return templateArr;
}


@end
