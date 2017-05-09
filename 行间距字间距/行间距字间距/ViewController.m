//
//  ViewController.m
//  行间距字间距
//
//  Created by Qianrun on 16/7/11.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeUI];
    
}

- (void)makeUI{
    NSString *infoStr = @"我是需要改变行间距与字间距的字符串，我是需要改变行间距与字间距的字符串，我是需要改变行间距与字间距的字符串我是需要改变行间距与字间距的字符串，我是需要改变行间距与字间距的字符串，我是需要改变行间距与字间距的字符串我是需要改变行间距与字间距的字符串，我是需改变行间距与字间距的字符串，我是需要改变行间距与字间距的字符串，我是需要改变行间距与字间距的字符串";
    UILabel *infoLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 10)];
    infoLab.text = infoStr;
    infoLab.numberOfLines = 0;
    infoLab.textAlignment = NSTextAlignmentLeft;
    infoLab.font = [UIFont systemFontOfSize:15.];
    infoLab.userInteractionEnabled = YES;
    infoLab.backgroundColor = [UIColor redColor];
    
    //实例化NSMutableAttributedString模型
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:infoStr];
    
    //建立行间距模型
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    
    //设置行间距
    [paragraphStyle1 setLineSpacing:5.f];
    
    //把行间距模型加入NSMutableAttributedString模型
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [infoStr length])];
    
    //设置字间距
    long number = 5.f;
    
    //CFNumberRef添加字间距
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedString1 addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedString1 length])];
    
    //清除CFNumberRef
    CFRelease(num);
    
    //给lab赋值改变好的文字
    [infoLab setAttributedText:attributedString1];
    
    //让lab内部自适应大小
    [infoLab sizeToFit];
    
    [self.view addSubview:infoLab];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
