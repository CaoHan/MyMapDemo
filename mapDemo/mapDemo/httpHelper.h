//
//  httpHelper.h
//  mapDemo
//
//  Created by 曹晗 on 16/7/7.
//  Copyright © 2016年 CaoHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface httpHelper : NSObject {
    
}
extern NSString * const kURL;

- (void) getLocationInfo:(NSString *)user_name success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure;
- (void) sendLocationInfo:(NSString *)user_name user_latitude:(NSString *)user_latitude
           user_longitude:(NSString *)user_longitude;
@end