//
//  ViewController.m
//  MusicPlayer
//
//  Created by DEVP-IOS-03 on 2017/3/30.
//  Copyright © 2017年 Hangzhou Jiyuan Jingshe Trade Co,. Ltd. All rights reserved.
//

#import "ViewController.h"

#import "OneViewController.h"

#import "ProgressSlider.h"
#import "TTRangeSlider.h"
@interface ViewController ()<TTRangeSliderDelegate>
@property (nonatomic, strong) ZFModalTransitionAnimator *animator;

@property (nonatomic, strong) PlayBar *playBar;

@property (nonatomic, strong) ProgressSlider *progressSlider;

@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSlider;
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSliderCurrency;
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSliderCustom;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  //  [self.view addSubview:self.playBar];
  //  [self.view addSubview:self.progressSlider];


    //standard rsnge slider
    self.rangeSlider.delegate = self;
    self.rangeSlider.minValue = 0;
    self.rangeSlider.maxValue = 200;
    self.rangeSlider.selectedMinimum = 50;
    self.rangeSlider.selectedMaximum = 150;

    //currency range slider
    self.rangeSliderCurrency.delegate = self;
    self.rangeSliderCurrency.minValue = 0;
    self.rangeSliderCurrency.maxValue = 100;
    self.rangeSliderCurrency.selectedMinimum = 0;
    self.rangeSliderCurrency.selectedMaximum = 0;
    self.rangeSliderCurrency.disableRightHandle = YES;
    self.rangeSliderCurrency.handleColor = [UIColor brownColor];
    self.rangeSliderCurrency.tintColorBetweenHandles = [UIColor redColor];
    self.rangeSliderCurrency.tintColorLineOnLeftHandle = [UIColor brownColor];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    self.rangeSliderCurrency.numberFormatterOverride = formatter;

    //custom number formatter range slider
    self.rangeSliderCustom.backgroundColor = [UIColor yellowColor];
    self.rangeSliderCustom.delegate = self;
    //string 要放在前面赋值
    self.rangeSliderCustom.maxLabel.string = @"0:00";
    self.rangeSliderCustom.minValue = 0.0;
    self.rangeSliderCustom.maxValue = 100;
    self.rangeSliderCustom.selectedMinimum = 0.0;
    self.rangeSliderCustom.selectedMaximum = 0;
    self.rangeSliderCustom.disableRange = YES;
    self.rangeSliderCustom.handleDiameter = 10.0;
    self.rangeSliderCustom.selectedHandleDiameterMultiplier = 1.2;
    self.rangeSliderCustom.lineHeight = 2.0;
    self.rangeSliderCustom.labelPadding = 2.0;
    self.rangeSliderCustom.maxLabelFont = [UIFont systemFontOfSize:6];
    self.rangeSliderCustom.maxLabelAccessibilityHint = @"maxLabelAccessibilityHint";
    self.rangeSliderCustom.tintColorBetweenHandles = [UIColor redColor];
    self.rangeSliderCustom.tintColorLineOnLeftHandle = [UIColor redColor];
    self.rangeSliderCustom.handleColor = [UIColor redColor];
    self.rangeSliderCustom.handleBorderColor = [UIColor whiteColor];
    self.rangeSliderCustom.handleBorderWidth = 3.0;
    NSNumberFormatter *customFormatter = [[NSNumberFormatter alloc] init];

    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    self.rangeSliderCustom.numberFormatterOverride = customFormatter;
   static  float count = 0.0;
    static  float count1 = 0.0;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        count = count+4.0;
        self.rangeSliderCurrency.selectedMinimum = count;
        count1 = count1+8.0;
        self.rangeSliderCurrency.selectedMaximum = count1;
    }];
}



#pragma mark TTRangeSliderViewDelegate
-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{
    if (sender == self.rangeSlider){
        NSLog(@"Standard slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
    else if (sender == self.rangeSliderCurrency) {
        NSLog(@"Currency slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
    else if (sender == self.rangeSliderCustom){
        NSLog(@"Custom slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
        self.rangeSliderCustom.maxLabel.string = @"2:40";
    }

}

/**
 * Called when the user has finished interacting with the RangeSlider
 */
- (void)didEndTouchesInRangeSlider:(TTRangeSlider *)sender{

}

/**
 * Called when the user has started interacting with the RangeSlider
 */
- (void)didStartTouchesInRangeSlider:(TTRangeSlider *)sender{

}


- (ProgressSlider *)progressSlider{
    if (!_progressSlider) {
        _progressSlider = [[[NSBundle mainBundle] loadNibNamed:@"ProgressSlider" owner:self options:nil]lastObject];
        _progressSlider.frame = CGRectMake(0, 100, 414, 60);
        _progressSlider.backgroundColor = [UIColor cyanColor];
    }
    return _progressSlider;
}

- (PlayBar *)playBar{
    if (!_playBar) {
        _playBar = [[[NSBundle mainBundle] loadNibNamed:@"PlayBar" owner:self options:nil] lastObject];
        _playBar.frame = CGRectMake(0, 300, 414, 90);
        [_playBar jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
             [self Amethod];
        }];
    }
    return _playBar;
}

- (IBAction)click:(id)sender {
    [self Amethod];
}


- (void)Amethod{
    OneViewController *modalVC = [[OneViewController alloc]init];
    modalVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;

    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:modalVC];
    self.animator.dragable = YES;
    self.animator.bounces = YES;
    self.animator.behindViewAlpha = 0.8;
    self.animator.behindViewScale = 0.9f;
    self.animator.transitionDuration = 0.8f;
    self.animator.direction =  ZFModalTransitonDirectionBottom;
    modalVC.transitioningDelegate = self.animator;
    [self presentViewController:modalVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
