//
//  UIDevice+UIDeviceCategory.h
//
//  Created by wjg on 20/12/2017.
//  Copyright © 2017 wujungao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (UIDeviceCategory)


/**
 @Description convert systemVersion String to Float Number

 @return float version number
 @discussion the float version number componets:major.miorpatch,e.g"10.3.1"-->10.3100
 */
+(float)systemVersionNumber;

@end
