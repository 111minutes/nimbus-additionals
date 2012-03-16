//
//  DXCellFactory.m
//  NimbusAdditionals
//
//  Created by Sergey Zenchenko on 3/7/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import "DXCellFactory.h"

@interface DXCellFactory()

@property (nonatomic, readwrite, copy) NSMutableDictionary* objectToCellMap;

@end

@implementation DXCellFactory
@synthesize delegate;
@dynamic objectToCellMap;

- (Class)cellClassForObject:(id)object {
    Class objectClass = [object class];
    Class cellClass = [self.objectToCellMap objectForKey:objectClass];
    
    return cellClass;
}


- (UITableViewCell *)tableViewModel: (NITableViewModel *)tableViewModel
                   cellForTableView: (UITableView *)tableView
                        atIndexPath: (NSIndexPath *)indexPath
                         withObject: (id)object {
    UITableViewCell* cell = nil;
    
    Class objectClass = [object class];
    
    Class cellClass = nil;
    
    if ([delegate respondsToSelector:@selector(classForCellWithIndexPath:)]) {
        cellClass = [delegate classForCellWithIndexPath:indexPath];
    }
    
    if (cellClass == nil) {
        cellClass = [self.objectToCellMap objectForKey:objectClass];    
    }
    
    // Explicit mappings override implicit mappings.
    if (nil != cellClass) {
        cell = [[self class] cellWithClass:cellClass tableView:tableView object:object];
        
    } else {
        cell = [[self class] tableViewModel:tableViewModel
                           cellForTableView:tableView
                                atIndexPath:indexPath
                                 withObject:object];
    }
    return cell;
}




@end
