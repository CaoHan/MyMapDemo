//
//  httpHelper.m
//  mapDemo
//
//  Created by 曹晗 on 16/7/7.
//  Copyright © 2016年 CaoHan. All rights reserved.
//

#import "httpHelper.h"

@implementation httpHelper

NSString * const kURL = @"http://192.168.1.101:8888/UserLocation";


- (void) getLocationInfo:(NSString *)user_name success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure{
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"user_name"] = user_name;
    
    NSString *url = [NSString stringWithFormat:@"%@/getUserLocation.php",kURL];
    
    [mgr GET:url parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"%@",responseObject);
         success(responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@",error);
         failure(error);
     }];
    
}

- (void) sendLocationInfo:(NSString *)user_name user_latitude:(NSString *)user_latitude
           user_longitude:(NSString *)user_longitude{
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.封装请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"user_name"] = user_name;
    params[@"user_latitude"] = user_latitude;
    params[@"user_longitude"] = user_longitude;
    
    NSString *url = [NSString stringWithFormat:@"%@/setUserLocation.php",kURL];
    
    
    [mgr GET:url parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"%@",responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@",error);
     }];
    
}
@end
