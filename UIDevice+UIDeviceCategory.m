//
//  UIDevice+UIDeviceCategory.m
//
//  Created by wjg on 20/12/2017.
//  Copyright © 2017 wujungao. All rights reserved.
//

#import "UIDevice+UIDeviceCategory.h"

@implementation UIDevice (UIDeviceCategory)

+(float)systemVersionNumber{

    float sysVerN=0;
    __block NSString *midSysVerStr=@"";
    
    //get version string
    NSString *sysVerStr=[UIDevice currentDevice].systemVersion;
    NSArray *sysVerStrArray=[sysVerStr componentsSeparatedByString:@"."];//the array arrange from major to patch
    
    [sysVerStrArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if(idx==1){
            //when enumerate second object,add "." into the previous midSysVerStr and the obj
            //this making the midSysVerStr at last can convert to float number
            midSysVerStr=[NSString stringWithFormat:@"%@.%@",midSysVerStr,obj];

        }else{
        
            midSysVerStr=[NSString stringWithFormat:@"%@%@",midSysVerStr,obj];
        }
    }];
    
    //get float value
    sysVerN=midSysVerStr.floatValue;
    
    return sysVerN;
}

@end
