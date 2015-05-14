//
//  shorthands.h
//  EDVELOP
//
//  Created by Ajeet Shakya on 5/1/15.
//  Copyright (c) 2015 EK Solutions Pvt Ltd. All rights reserved.
//

#ifndef EDVELOP_shorthands_h
#define EDVELOP_shorthands_h

///SHORT-HANDS
#define rgb(r, g, b) [UIColor colorWithRed:(float)(r/255.0) green:(float)(g/255.0) blue:(float)(b/255.0) alpha:1]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define image(str) [UIImage imageNamed:str]
#define CGM(x, y, w, h) CGRectMake(x, y, w, h)
#define isString(obj) [obj isKindOfClass:[NSString class]]
#define isNumber(obj) [obj isKindOfClass:[NSNumber class]]
#define isArray(obj) [obj isKindOfClass:[NSArray class]]
#define isBlank(val) [[val stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]
#define isNSNull(obj) (obj == (id)[NSNull null])
#define isBlankORNull(obj) ((obj == (id)[NSNull null]) || [[obj stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
#define isNilORNull(obj) ((obj == (id)[NSNull null]) || !obj)
#define trim(val) [val stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
#define contains(string, substring) [[string lowercaseString] rangeOfString:[substring lowercaseString]]
#define CLEAR_CONSOLE() NSLog(@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

#define degreesToRadian(x) (M_PI * (x) / 180.0)

#define kTopSegment @"topSegment"
#define kBotSegment @"botSegment"
#define kBarLabel @"barLabel"
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

#endif
