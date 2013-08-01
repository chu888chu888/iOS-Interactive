//
//  ViewController.m
//  InteractiveExample
//
//  Created by 周方 on 13-6-14.
//  Copyright (c) 2013年 xuhengfei. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "XHFApi.h"
#import "XHFExecutor.h"
#import "XHFSimpleExecutor.h"
#import "XHFExecutorPlugin.h"
#import "XHFExecutorContext.h"
#import "SimpleApi.h"


@interface ViewController ()

@end

@implementation ViewController{
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScrollView *scroll=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scroll];
    
    SimpleApi *api=[[SimpleApi alloc]initWithUrl:@"http://www.baidu.com"];
    [[[XHFSimpleExecutor alloc]init]execute:api completeOnMainThread:^(NSString* result, NSException *exception) {
        UILabel *label=[[UILabel alloc]init];
        label.text=result;
        label.numberOfLines=0;
        CGSize size=[label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(320, 100000)];
        label.frame=CGRectMake(0, 0, size.width, size.height);
        [scroll addSubview:label];
        scroll.contentSize=size;
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end



