# SPDateTimePickerViewDemo
时间选择器
###项目需要自己简单封装了一款多功能的时间选择器、欢迎大家使用。如果有更好的建议、不吝赐教，谢谢！
![image.png](http://upload-images.jianshu.io/upload_images/4881197-cd2db67cdbcc4b49.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##使用方法
```
    SPDateTimePickerView *pickerView = [[SPDateTimePickerView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height)];
    pickerView.pickerViewMode = SPDatePickerModeDateHourMinuteSecond;
    pickerView.delegate = self;
    pickerView.title = @"时间选择器";
    [self.view addSubview:pickerView];
    [pickerView showDateTimePickerView];
```
使用例子：
![image.png](http://upload-images.jianshu.io/upload_images/4881197-8569524cd54d43f7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
代码：
```
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
```
