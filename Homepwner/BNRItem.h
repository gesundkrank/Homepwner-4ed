//
//  BNRItem.h
//  RandomItems
//
//  Created by Jan Grassegger on 31.03.14.
//  Copyright (c) 2014 anycook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

@property (nonatomic, copy) NSString *itemKey;

+ (instancetype)randomItem;

//Designated intializer for BNRItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

@end
