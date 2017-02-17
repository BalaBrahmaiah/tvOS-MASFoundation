//
//  ViewController.m
//  SampleTvOSApp
//
//  Created by Akshay on 16/02/17.
//  Copyright © 2017 CA. All rights reserved.
//

#import "ViewController.h"
#import <tvOS_MASFoundation/tvOS MASFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [MAS setGrantFlow:MASGrantFlowPassword];
    
   
    
    [MAS setUserLoginBlock:
     ^(MASBasicCredentialsBlock  _Nonnull basicBlock, MASAuthorizationCodeCredentialsBlock  _Nonnull authorizationCodeBlock) {
         
         basicBlock(@"syed", @"dost1234", NO, nil );
         
     }];

//    [MAS startWithDefaultConfiguration:YES completion:^(BOOL completed, NSError * _Nullable error) {
//        
//        
//        [MAS getFrom:@"/protected/resource/products" withParameters:nil andHeaders:nil completion:^(NSDictionary<NSString *, id> * _Nullable responseInfo, NSError * _Nullable error) {
//            
//            NSLog(@"%@",error);
//        }];
//        
//    }];
    ///////
    [MAS startWithDefaultConfiguration:YES completion:^(BOOL completed, NSError * _Nullable error) {
        
        
        [[MASDevice currentDevice] deregisterWithCompletion:^(BOOL completed, NSError * _Nullable error){
            
            [[MASDevice currentDevice] resetLocally];
            
            [MAS getFrom:@"/protected/resource/products" withParameters:nil andHeaders:nil completion:^(NSDictionary<NSString *, id> * _Nullable responseInfo, NSError * _Nullable error) {
                 NSLog(@"%@",error);
                
            }];
        }];
    }];
    //////
    ////
//    NSURL *URL = [NSURL URLWithString:@"http://example.com/file.zip"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
//                                            completionHandler:
//                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
//                                      // ...
//                                  }];
//    
//    [task resume];
    
    ///

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
