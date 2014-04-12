//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Jan Grassegger on 12.04.14.
//  Copyright (c) 2014 Jan Graßegger. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;
@property (nonatomic, readonly) NSArray *worthItems;
@property (nonatomic, readonly) NSArray *unworthItems;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;

@end
