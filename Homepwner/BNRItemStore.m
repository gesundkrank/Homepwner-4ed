//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Jan Grassegger on 12.04.14.
//  Copyright (c) 2014 Jan Graßegger. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    //Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItemStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

- (NSArray *)worthItems
{
    NSMutableArray *worthItems = [[NSMutableArray alloc] init];
    for(BNRItem *item in self.privateItems){
        if(item.valueInDollars > 50) [worthItems addObject:item];
    }
    return worthItems;
}

- (NSArray *)unworthItems
{
    NSMutableArray *unworthItems = [[NSMutableArray alloc] init];
    for(BNRItem *item in self.privateItems){
        if(item.valueInDollars <= 50) [unworthItems addObject:item];
    }
    return unworthItems;
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    
    return item;
}

@end
