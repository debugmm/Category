//
//  NSString+CateString.m
//
//  Created by wjg on 22/09/2017.
//  Copyright © 2017 wjg All rights reserved.
//

#import "NSString+CateString.h"

@implementation NSString (CateString)

#pragma mark - Base
+(BOOL)isEmptyString:(NSString *)string{

    if(string &&
       [string isKindOfClass:[NSString class]] &&
       string.length>0){

        return NO;

    }else{

        return YES;
    }
}

+(NSString *)stringByTrimmingBothEndWhiteSpace:(NSString *)string{

    if([NSString isEmptyString:string]){

        //do not using nil,it can give rise to bug.
        return [[NSString alloc] init];

    }else{

        return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
}

#pragma mark - Expend
-(NSComparisonResultAlias)versionStringCompare:(NSString *)versionStringB{
    
    __block NSComparisonResultAlias result=NSComparisonOccurError;
    
    //check version string
    NSString *versionStringA=[NSString stringByTrimmingBothEndWhiteSpace:self];
    if([NSString isEmptyString:versionStringA]){
    
        return result;
    }
    versionStringB=[NSString stringByTrimmingBothEndWhiteSpace:versionStringB];
    if([NSString isEmptyString:versionStringB]){
    
        return result;
    }
    
    //convert version string to components array
    NSMutableArray *vsa=[[versionStringA componentsSeparatedByString:@"."] mutableCopy];
    NSMutableArray *vsb=[[versionStringB componentsSeparatedByString:@"."] mutableCopy];
    
    //format array
    NSInteger count=vsa.count-vsb.count;
    id midarray=nil;
    if(count>0){
        
        midarray=vsb;
        
    }else if(count<0){
        
        midarray=vsa;
    }
    
    if(midarray){
    
        count=labs(count);
        
        for(NSInteger i=1;i<=count;i++){
            
            [((NSMutableArray *)midarray) addObject:@"0"];
        }
    }
    
    //compare
    result=NSOrderedSameAlias;
    [vsa enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSInteger objAInteger=((NSString *)obj).integerValue;
        NSInteger objBInteger= [[vsb objectAtIndex:idx] integerValue];
        
        if(objAInteger!=objBInteger){
        
            if(objAInteger>objBInteger){//Descending
            
                result=NSOrderedDescendingAlias;
                
            }else{
            
                result=NSOrderedAscendingAlias;
            }
            
            *stop=YES;
        }
    }];
    
    return result;
}

@end
