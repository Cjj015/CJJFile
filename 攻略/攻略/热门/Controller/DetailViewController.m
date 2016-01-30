//
//  DetailViewController.m
//  攻略
//
//  Created by 蔡 on 16/1/27.
//  Copyright © 2016年 lanouhn. All rights reserved.
//


#import "DetailViewController.h"
#import <WebKit/WebKit.h>
#import "SVProgressHUD.h"
@interface DetailViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation DetailViewController

- (void)loadView {
    [super loadView];
        self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    _webView.backgroundColor = [UIColor whiteColor];
    self.view = _webView;
   
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"宝贝详情";
    [SVProgressHUD showErrorWithStatus:@"亲，马上到"];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.URL]]];
    [SVProgressHUD dismiss];
    ((WKWebView *)self.view).allowsBackForwardNavigationGestures = YES;
    
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.navigationDelegate = self;
    }
    return _webView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
