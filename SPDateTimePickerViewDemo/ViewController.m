//
//  ViewController.m
//  SPDateTimePickerViewDemo
//
//  Created by 罗盼 on 2018/2/4.
//  Copyright © 2018年 罗盼. All rights reserved.
//

#import "ViewController.h"
#import "SPDateTimePickerView.h"

@interface ViewController ()<SPDateTimePickerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array = @[@"年",
                       @"年月",
                       @"年月日",
                       @"年月日时",
                       @"年月日时分",
                       @"年月日时分秒",
                       @"时分",
                       @"时分秒",
                       @"分秒"];
    
    //方块的个数
    NSInteger count = array.count;
    
    //方块的尺寸
    NSInteger maxColsCount = 2;//一行中最大列数
    CGFloat buttonW = [UIScreen mainScreen].bounds.size.width/maxColsCount;
    CGFloat buttonH = 80;
    
    //创建所有的方块
    for (int i = 0; i < count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];

        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        button.tag = 100 + i;
        [button addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat buttonX = (i % maxColsCount) * buttonW;//button的X
        CGFloat buttonY = 100 + (i / maxColsCount) * buttonH;//button的Y
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}
- (void)buttonOnClick:(UIButton *)btn{
    SPDateTimePickerView *pickerView = [[SPDateTimePickerView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height)];
    pickerView.pickerViewMode = btn.tag - 100;
    pickerView.delegate = self;
    pickerView.title = @"时间选择器";
    [self.view addSubview:pickerView];
    [pickerView showDateTimePickerView];
}
#pragma mark - SPDateTimePickerViewDelegate
- (void)didClickFinishDateTimePickerView:(NSString *)date {
    NSLog(@"%@",date);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
