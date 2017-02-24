//
//  MYJFNormalKey.h
//  mobileapp
//
//  Created by nethanhan on 16/7/26.
//  Copyright © 2016年 myjf. All rights reserved.
//

#ifndef MYJFNormalKey_h
#define MYJFNormalKey_h
//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//以iphone6屏幕为基准的宽高比例
#define ADAPTERSCALE  [[UIScreen mainScreen] bounds].size.width/375

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


//第三方框架
#import "Masonry.h"
#endif /* MYJFNormalKey_h */
