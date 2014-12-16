//
//  MyMessagesModel.m
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "MyMessagesModel.h"

@implementation MyMessagesModel
- (NSMutableArray *)JsonParserWithSend:(NSDictionary*)responseData{
    NSMutableArray *array = [NSMutableArray array];
    
    id result = [responseData objectForKey:@"sendMessages"];
    
    if ([result isKindOfClass:[NSString class]]) {
        
    }else{
        NSArray *dicArray = [responseData objectForKey:@"sendMessages"];
        for (int i = 0; i < dicArray.count; i++) {
            NSDictionary *dic = dicArray[i];
            self.address = [dic objectForKey:@"address"];
            self.city = [dic objectForKey:@"city"];
            self.color = [dic objectForKey:@"color"];
            self.content = [dic objectForKey:@"content"];
            self.coverPicUrl = [dic objectForKey:@"coverPicUrl"];
            self.height = [dic objectForKey:@"height"];
            self.messageeID = [dic objectForKey:@"messageeID"];
            self.province = [dic objectForKey:@"province"];
            self.receiveId = [dic objectForKey:@"receiveId"];
            self.receiveTime = [dic objectForKey:@"receiveTime"];
            self.receiveUserName = [dic objectForKey:@"receiveUserName"];
            self.receiveUserNick = [dic objectForKey:@"receiveUserNick"];
            self.receiveUserPicUrl = [dic objectForKey:@"receiveUserPicUrl"];
            self.senderId = [dic objectForKey:@"senderId"];
            self.senderTime = [dic objectForKey:@"senderTime"];
            self.templetAudioUrl = [dic objectForKey:@"templetAudioUrl"];
            self.templetUrl = [dic objectForKey:@"templetUrl"];
            self.width = [dic objectForKey:@"width"];
            self.wordx = [dic objectForKey:@"wordx"];
            self.wordy = [dic objectForKey:@"wordy"];
            [array addObject:self];
        }
    }
    return array;
}
@end
