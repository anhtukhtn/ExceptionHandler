//
//  ExceptionHandler.h
//  iOS_SDK
//
//  Created by ANH TU on 9/26/15.
//  Copyright (c) 2015 Netvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExceptionHandler : NSObject

+ (ExceptionHandler *)getInstance;

////////////////////////////////////////////////////////////////////////////////////////////////////
/*!
 * @brief   create a handler for exception
 */
- (void)createExceptionHandler;

@end
