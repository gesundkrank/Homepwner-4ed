//
//  BNRItem.m
//  RandomItems
//
//  Created by Jan Grassegger on 31.03.14.
//  Copyright (c) 2014 anycook. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem
{
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    //Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    //Get random index
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // Note that NSInteger is not an object, but a type definition for "long"
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0'+arc4random()%10,
                                    'A'+arc4random()%26,
                                    '0'+arc4random()%10,
                                    'A'+arc4random()%26,
                                    '0'+arc4random()%10];
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    return newItem;
}

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    self = [super init];
    
    if(self) {
        //Give initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        //Set date to current datetime
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@) : Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}
@end
