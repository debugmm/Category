//
//  NSString+CateString.h
//
//  Created by wjg on 22/09/2017.
//  Copyright © 2017 wjg All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum NSComparisonResultAlias : NSInteger {
    
    NSOrderedAscendingAlias = NSOrderedAscending,
    NSOrderedSameAlias=NSOrderedSame,
    NSOrderedDescendingAlias=NSOrderedDescending,
    NSComparisonOccurError=-999
    
} NSComparisonResultAlias;

@interface NSString (CateString)

#pragma mark - Base
/**
 *  @abstract judgment string whether content.length==0/nil/NULL or not.
 *
 *  @param string type:NSString.
 *
 *  @return BOOL(YES,content is empty).
 */
+(BOOL)isEmptyString:(NSString *)string;

/**
 *  @abstract delete string both end white space.
 *
 *  @param string type:NSString.
 *
 *  @return new string that deleted both end white space.
 */
+(NSString *)stringByTrimmingBothEndWhiteSpace:(NSString *)string;

#pragma mark - Expend

/**
 @Description compare versionString

 @param versionStringB versionStringB
 @return NSComparisonResultAlias
 
 @discussion the versionString format should conform"major.minor.patch"
             the component value is useful(e.g "10.1.0").it must not like "10.01.0".
 */
-(NSComparisonResultAlias)versionStringCompare:(NSString *)versionStringB;

@end