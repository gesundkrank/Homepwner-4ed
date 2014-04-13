//
//  BNRDateViewController.m
//  Homepwner
//
//  Created by Jan Graßegger on 13.04.14.
//  Copyright (c) 2014 Jan Graßegger. All rights reserved.
//

#import "BNRDateViewController.h"
#import "BNRItem.h"

@interface BNRDateViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *dateField;

@end

@implementation BNRDateViewController

- (id)init
{
    self = [super init];
    if (self) {
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:@selector(done)];
        self.navigationItem.rightBarButtonItem = bbi;
    }
    return self;
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.dateField.date = item.dateCreated;
}

- (void)done
{
    NSLog(@"Finished editing");
    self.item.dateCreated = self.dateField.date;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
