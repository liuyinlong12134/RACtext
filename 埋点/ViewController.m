//
//  ViewController.m
//  埋点
//
//  Created by liurui on 2016/12/27.
//  Copyright © 2016年 liurui. All rights reserved.
//

#import "ViewController.h"
#import "towViewViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(clickright)];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.tag = 100;
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    btn2.tag = 101;
   [btn2 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn2.backgroundColor = [UIColor redColor];
     [self.view addSubview:btn2];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)clickright
{
    towViewViewController * tow = [[towViewViewController alloc]init];
    [self.navigationController pushViewController:tow animated:YES];
}
-(void)clickBtn:(UIButton *)btn
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
