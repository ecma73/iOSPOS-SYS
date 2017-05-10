//
//  PathAndDirectoryFunction.m
//  MLIproposal
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import "PathAndDirectoryFunction.h"

@implementation PathAndDirectoryFunction

+ (PathAndDirectoryFunction*)pathAndDirectoryInstance
{
    static id PathAndDirectoryInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        PathAndDirectoryInstance = [PathAndDirectoryFunction new];
    });
    
    return PathAndDirectoryInstance;
}

#pragma mark - get the path or file path of the personal folder
/**
 get personal folders
 */
- (NSString*)getDocumentDirectoryForComponent:(NSString*)comp
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:comp];
    return documentsDirectory;
}

#pragma mark - get the full path in the document folder
- (NSString*)getDocumentPathForFileName:(NSString*)fileName andExtension:(NSString*)ext
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:fileName];
    fullPath = [fullPath stringByAppendingPathExtension:ext];
    return fullPath;
}

#pragma mark - get the full path in the Temporary folder
- (NSString*)getTempPathForFileName:(NSString*)file andExtension:(NSString*)ext;
{
    NSString *tempDirectory = NSTemporaryDirectory();
    NSString *fullPath = [tempDirectory stringByAppendingPathComponent:file];
    fullPath = [fullPath stringByAppendingPathExtension:ext];
    return fullPath;
}

#pragma mark - get the full path in the Cache folder
- (NSString*)getCachePathForFileName:(NSString*)file andExtension:(NSString*)ext
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *cacheFile = [cachePath stringByAppendingPathComponent:file];
    cacheFile = [cacheFile stringByAppendingPathExtension:ext];
    return cacheFile;
}

@end
