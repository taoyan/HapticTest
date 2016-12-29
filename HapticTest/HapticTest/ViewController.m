//
//  ViewController.m
//  HapticTest
//
//  Created by yant on 16/12/29.
//  Copyright © 2016年 yant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UINotificationFeedbackGenerator *notificationFeedbackGenerator;

@property(nonatomic, strong)UIImpactFeedbackGenerator *lightImpactFeedbackGenerator;

@property(nonatomic, strong)UIImpactFeedbackGenerator *mediumImpactFeedbackGenerator;

@property(nonatomic, strong)UIImpactFeedbackGenerator *heavyImpactFeedbackGenerator;

@property(nonatomic, strong)UISelectionFeedbackGenerator *selectionFeedbackGenerator;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *btn1 = [UIButton new];
    UIButton *btn2 = [UIButton new];
    UIButton *btn3 = [UIButton new];
    UIButton *btn4 = [UIButton new];
    UIButton *btn5 = [UIButton new];
    UIButton *btn6 = [UIButton new];
    UIButton *btn7 = [UIButton new];
    
    NSArray *btnArr = @[btn1, btn2, btn3, btn4, btn5, btn6, btn7];
    NSArray *colorArr = @[[UIColor redColor],[UIColor greenColor], [UIColor purpleColor], [UIColor blueColor],
                          [UIColor orangeColor],[UIColor brownColor], [UIColor cyanColor]];
    NSArray *titleArr = @[@"UINotificationFeedbackGenerator\nTypeSuccess",@"UINotificationFeedbackGenerator\nTypeWarning",
                          @"UINotificationFeedbackGenerator\nTypeError",@"UIImpactFeedbackGenerator\nStyleLight",
                          @"UIImpactFeedbackGenerator\nStyleMedium",@"UIImpactFeedbackGenerator\nStyleHeavy",
                          @"UISelectionFeedbackGenerator\nselectionChanged"];
    
    for (int i = 0; i < btnArr.count ; i++) {
        UIButton *btn = btnArr[i];
        btn.titleLabel.numberOfLines = 0;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setBackgroundColor:colorArr[i]];
        btn.tag = 1000 + i;
        [btn addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        [btn.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.5].active = YES;
        [btn.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.25].active = YES;
    }
    
    
    [btn1.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [btn1.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    
    [btn2.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [btn2.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    
    [btn3.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [btn3.topAnchor constraintEqualToAnchor:btn1.bottomAnchor].active = YES;
    
    [btn4.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [btn4.topAnchor constraintEqualToAnchor:btn2.bottomAnchor].active = YES;
    
    [btn5.topAnchor constraintEqualToAnchor:btn3.bottomAnchor].active = YES;
    [btn5.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    
    [btn6.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [btn6.topAnchor constraintEqualToAnchor:btn4.bottomAnchor].active = YES;
    
    [btn7.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [btn7.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    
    
    
    self.notificationFeedbackGenerator = [UINotificationFeedbackGenerator new];
    self.lightImpactFeedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
    self.mediumImpactFeedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    self.heavyImpactFeedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
    self.selectionFeedbackGenerator = [UISelectionFeedbackGenerator new];
    
    [self.notificationFeedbackGenerator prepare];
    [self.lightImpactFeedbackGenerator prepare];
    [self.mediumImpactFeedbackGenerator prepare];
    [self.heavyImpactFeedbackGenerator prepare];
    [self.selectionFeedbackGenerator prepare];
}


#pragma mark -Handle Method
- (void)tapped:(UIButton *)sender
{
    switch (sender.tag) {
        case 1000:
            [self.notificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeSuccess];
            break;
        case 1001:
            [self.notificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeWarning];
            break;
        case 1002:
            [self.notificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeError];
            break;
        case 1003:
            [self.lightImpactFeedbackGenerator impactOccurred];
            break;
        case 1004:
            [self.mediumImpactFeedbackGenerator impactOccurred];
            break;
        case 1005:
            [self.heavyImpactFeedbackGenerator impactOccurred];
            break;
        default:
        {
            [self.selectionFeedbackGenerator selectionChanged];
        }
            break;
    }
}


@end
