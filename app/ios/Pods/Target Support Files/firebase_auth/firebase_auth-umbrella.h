#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "messages.g.h"
#import "CustomPigeonHeader.h"
#import "FLTAuthStateChannelStreamHandler.h"
#import "FLTIdTokenChannelStreamHandler.h"
#import "FLTPhoneNumberVerificationStreamHandler.h"
#import "FLTFirebaseAuthPlugin.h"

FOUNDATION_EXPORT double firebase_authVersionNumber;
FOUNDATION_EXPORT const unsigned char firebase_authVersionString[];

