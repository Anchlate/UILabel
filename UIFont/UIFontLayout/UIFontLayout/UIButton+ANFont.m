//
//  UIButton+ANFont.m
//  UIFontLayout
//
//  Created by Qianrun on 16/8/5.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "UIButton+ANFont.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//不同设备的屏幕比例(当然倍数可以自己控制)
#define SizeScale ((SCREEN_HEIGHT > 568) ? SCREEN_HEIGHT/568 : 1)

@implementation UIButton (ANFont)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.titleLabel.tag != 333){
            CGFloat fontSize = self.titleLabel.font.pointSize;
            self.titleLabel.font = [UIFont systemFontOfSize:fontSize*SizeScale];
        }
    }
    return self;
}

@end


@implementation UILabel (myFont)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    if (self) {
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.tag != 333){
            CGFloat fontSize = self.font.pointSize;
            self.font = [UIFont systemFontOfSize:fontSize*SizeScale];
        }
    }
    return self;
}

@end