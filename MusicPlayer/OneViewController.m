//
//  OneViewController.m
//  MusicPlayer
//
//  Created by DEVP-IOS-03 on 2017/3/30.
//  Copyright © 2017年 Hangzhou Jiyuan Jingshe Trade Co,. Ltd. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addView];


}

- (void)addView{
/*
    (lldb) po fromViewController.view.frame
    (origin = (x = 0, y = 0), size = (width = 414, height = 736))

    (lldb) po fromViewController.view.frame
    (origin = (x = 20.700004935264587, y = 36.800008773803711), size = (width = 372.59999012947083, height = 662.39998245239258))
*/
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40)];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];

    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:view.bounds];
    toolBar.barStyle = UIBarStyleBlack; // 改变barStyle
    //[view addSubview:toolBar];


    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 40, 80, 80)];
    view1.backgroundColor = [UIColor cyanColor];
    UIToolbar *toolBar1 = [[UIToolbar alloc] initWithFrame:view.bounds];
    toolBar1.barStyle = UIBarStyleDefault; // 改变barStyle
    [toolBar1 addSubview:view1];
    [view addSubview:toolBar1];

}



- (void)dismiss{
    NSLog(@"%@",self);
    [self dismissViewControllerAnimated:YES completion:nil];
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
