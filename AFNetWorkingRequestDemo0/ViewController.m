//
//  ViewController.m
//  AFNetWorkingRequestDemo0
//
//  Created by jianleer on 14-10-15.
//  Copyright (c) 2014年 jianleer. All rights reserved.
//

#define BASE_URL_STRING @"http://api.map.baidu.com/telematics/v3/weather?location=北京&output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ"

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
}

-(void)initView
{
    UIButton*button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 100, 60, 44);
    [button setTitle:@"GET" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(GETMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    UIButton*button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(120, 200, 60, 44);
    [button1 setTitle:@"POST" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(POSTMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    
    
}


-(void)GETMethod
{
//    GET
    NSLog(@"GET");
    NSString*weatherUrl = BASE_URL_STRING;
    NSString*cStr = [weatherUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager*manager =[AFHTTPRequestOperationManager manager];
    [manager GET:cStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"-----JSON:%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"-----Error:%@",error);
    }];
    
}

-(void)POSTMethod
{
    NSLog(@"POST");
    //POST
    NSString*str = BASE_URL_STRING;
    NSString*cStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager*manager = [AFHTTPRequestOperationManager manager];
    [manager POST:cStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON:%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
























@end
