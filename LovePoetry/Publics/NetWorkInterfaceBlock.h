//
//  NetWorkInterfaceBlock.h
//  Lesson_0330_final_Exercise
//
//  Created by 张阳帅 on 15-3-31.
//  Copyright (c) 2015年 张茨一飞. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SuccessfulBlock)(NSDictionary *dic);

typedef BOOL (^FailBlock)(NSError *error);

@interface NetWorkInterfaceBlock : NSObject



-(id)initWithSuccessful:(SuccessfulBlock)aSuccessBlock fail:(FailBlock)aFailBlock;
-(void)get:(NSString *)urlString;
-(void)post:(NSString *)urlString params:(NSString *)paramString;
@end
