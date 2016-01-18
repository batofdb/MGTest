//
//  ViewController.m
//  MGTest
//
//  Created by Francis Bato on 1/17/16.
//  Copyright © 2016 FrancisBato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create dictionary
    NSDictionary *dict = @{ @"id" : @1234.0123, @"first_name" : @"Elon", @"last_name" : @"Musk", @"age" : @44 };

    // Print JSON
    NSLog(@"%@",[self toJSON:dict]);
}

- (NSString *)toJSON:(NSDictionary *)dictionary {

    NSString *str = [NSString new];

    // Obtains all keys for given dictionary
    NSArray *allKeys = [dictionary allKeys];

    for (NSString *key in allKeys) {
        if ([key isEqualToString:allKeys.firstObject]) {
            // If first object open bracket
            str = [str stringByAppendingString:@"{ "];
        }

        // Append key string
        str = [str stringByAppendingString:[NSString stringWithFormat:@"\"%@\": ",key]];

        // Append value string
        str = [str stringByAppendingString:[NSString stringWithFormat:@"%@",[self getValueStringWithKey:key inDictionary:dictionary]]];

        if ([key isEqualToString:allKeys.lastObject]) {
            // If last object close bracket
            str = [str stringByAppendingString:@" }"];
        } else {
            // comma for next key value paring
            str = [str stringByAppendingString:@", "];
        }
    }

    return str;
}

- (NSString *)getValueStringWithKey:(NSString *)key inDictionary:(NSDictionary *)dictionary {

    NSString *valueString = [NSString new];

    if ([dictionary[key] isKindOfClass:[NSString class]]) {
        // If string encase in quotes
        valueString = [NSString stringWithFormat:@"\"%@\"",dictionary[key]];
    } else if ([dictionary[key]  isKindOfClass:[NSNumber class]]) {
        valueString = [NSString stringWithFormat:@"%@",dictionary[key]];
    }
    
    return valueString;
}

@end
