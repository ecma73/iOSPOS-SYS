//
//  DatabaseConnection.h
//  ExamKing
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseConnection : NSObject

+ (FMDatabase*)GetPosDB;

@end
