//
//  CustomAnnotation.h
//  mapDemo
//
//  Created by 曹晗 on 16/7/7.
//  Copyright © 2016年 CaoHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject
<MKAnnotation>
/** 坐标(标记大头针扎在哪个位置) */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 子标题 */
@property (nonatomic, copy) NSString *subtitle;


/** 图标 */
@property (nonatomic, copy) NSString *icon;
@end