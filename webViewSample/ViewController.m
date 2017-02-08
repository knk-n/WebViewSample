//
//  ViewController.m
//  fukuchan
//
//  Created by Kensuke Nishimura on 2017/01/30.
//  Copyright © 2017年 EQS, Inc. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<UIWebViewDelegate,WKUIDelegate> {
    UIWebView* wv;
    WKWebView* wkv;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0){
        wkv = [[WKWebView alloc] init];
        [wkv setUIDelegate:self];
        wkv.autoresizesSubviews = YES;
        wkv.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [wv setScalesPageToFit:YES];
        [wkv.scrollView setBounces:NO];
        [wkv setFrame:self.view.frame];
        [self.view addSubview:wkv];
    }else{
        wv = [[UIWebView alloc] init];
        [wv setDelegate:self];
        wv.autoresizesSubviews = YES;
        wv.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [wv setScalesPageToFit:YES];
        [wv.scrollView setBounces:NO];
        [wv setFrame:self.view.frame];
        [self.view addSubview:wv];
    }
    [self loadURL:@"http://eqs-test.s3.amazonaws.com/kadai/fukuda/kadai.html"];
}

- (void)loadURL:(NSString *)url {
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0){
//        NSLog(@"WKWebView!!!!");
        [wkv loadRequest:req];
    }else{
        [wv loadRequest:req];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(nonnull NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
