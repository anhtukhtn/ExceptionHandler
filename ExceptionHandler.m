//
//  ExceptionHandler.m
//  iOS_SDK
//
//  Created by ANH TU on 9/26/15.
//  Copyright (c) 2015 Netvis. All rights reserved.
//

#import "ExceptionHandler.h"
#import <UIKit/UIKit.h>

static ExceptionHandler * _shareExceptionHandler = nil;

@implementation ExceptionHandler

+ (ExceptionHandler *)getInstance
{
  if (_shareExceptionHandler == nil) {
    _shareExceptionHandler = [ExceptionHandler new];
  };
  return _shareExceptionHandler;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
/*!
 * @brief   create a handler for exception
 */
- (void)createExceptionHandler
{
  NSSetUncaughtExceptionHandler(&exceptionHandler);
  
  struct sigaction mySigAction;
  mySigAction.sa_sigaction = exceptionHandlerSpecialSIGNAL;
  mySigAction.sa_flags = SA_SIGINFO;
  sigemptyset(&mySigAction.sa_mask);
  sigaction(SIGQUIT, &mySigAction, NULL);
  sigaction(SIGILL, &mySigAction, NULL);
  sigaction(SIGTRAP, &mySigAction, NULL);
  sigaction(SIGABRT, &mySigAction, NULL);
  sigaction(SIGEMT, &mySigAction, NULL);
  sigaction(SIGFPE, &mySigAction, NULL);
  sigaction(SIGBUS, &mySigAction, NULL);
  sigaction(SIGSEGV, &mySigAction, NULL);
  sigaction(SIGSYS, &mySigAction, NULL);
  sigaction(SIGPIPE, &mySigAction, NULL);
  sigaction(SIGALRM, &mySigAction, NULL);
  sigaction(SIGXCPU, &mySigAction, NULL);
  sigaction(SIGXFSZ, &mySigAction, NULL);
 
}

void exceptionHandler(NSException * exception)
{
  NSArray * stack = [exception callStackSymbols];
  NSString * strStack = [stack description];
  strStack = [NSString stringWithFormat:@"Reason: %@.\n Callstack: %@",[exception reason],strStack];
  NSLog(@"exceptionHandler trace : %@", strStack);
}

void exceptionHandlerSpecialSIGNAL(int sig, siginfo_t *info, void *context) {
  /// just can get sig "Signal %@ was raised."
}

@end
