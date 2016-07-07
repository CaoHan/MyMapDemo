//
//  CustomAnnotationView.m
//  mapDemo
//
//  Created by 曹晗 on 16/7/7.
//  Copyright © 2016年 CaoHan. All rights reserved.
//

#import "CustomAnnotationView.h"
#import "CustomAnnotation.h"

@implementation CustomAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        // 显示标题和子标题
        self.canShowCallout = YES;
        
        // 添加按钮
        self.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        self.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
        
        // 设置标题\子标题面板距离大头针控件的间距
        // self.calloutOffset = CGPointMake(0, -10);
    }
    return self;
}


+ (instancetype)annotationViewWithMapView:(MKMapView *)mapView
{
    // 1.先从缓存池中取出可循环利用的大头针控件
    static NSString *ID = @"anno";
    CustomAnnotationView *annoView = (CustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    
    // 2.没有可循环利用的大头针控件
    if (annoView == nil) {
        annoView = [[CustomAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:ID];
    }
    
    return annoView;
}

- (void)setAnnotation:(CustomAnnotation *)annotation
{
    [super setAnnotation:annotation];
    
    // 设置图片
    self.image = [UIImage imageNamed:annotation.icon];
}

@end
