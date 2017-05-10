//
//  PathAndDirectoryFunction.h
//  MLIproposal
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

#define db_db @"db"
#define db_sqlite @"sqlite"
#define db_data @"pos"

@interface PathAndDirectoryFunction : NSObject

+ (PathAndDirectoryFunction*)pathAndDirectoryInstance;

- (NSString*)getDocumentDirectoryForComponent:(NSString*)comp;
- (NSString*)getDocumentPathForFileName:(NSString*)fileName andExtension:(NSString*)ext;
- (NSString*)getTempPathForFileName:(NSString*)file andExtension:(NSString*)ext;
- (NSString*)getCachePathForFileName:(NSString*)file andExtension:(NSString*)ext;

@end
