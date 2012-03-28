//
//  DXCellFactory.m
//  NimbusAdditionals
//
//  Created by Sergey Zenchenko on 3/7/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import "DXCellFactory.h"
#import "DXCellModel.h"
#import "DXCellDelegate.h"

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
    
    DXCellModel *model = (DXCellModel *) object;
    
    Class objectClass = [model.object class];
    
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


+ (UITableViewCell *)cellWithClass:(Class)cellClass
                         tableView:(UITableView *)tableView
                            object:(id)object {
    UITableViewCell* cell = nil;
    
    NSString* identifier = NSStringFromClass(cellClass);
    
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell) {
        UITableViewCellStyle style = UITableViewCellStyleDefault;
        if ([object respondsToSelector:@selector(cellStyle)]) {
            style = [object cellStyle];
        }
        cell = [[cellClass alloc] initWithStyle:style reuseIdentifier:identifier];
    }
        
    // Allow the cell to configure itself with the object's information.
    
    if ([cell respondsToSelector:@selector(shouldUpdateCellWithModel:)]) {
        [(id<DXCellDelegate>)cell shouldUpdateCellWithModel:object];
    }
    else if ([cell respondsToSelector:@selector(shouldUpdateCellWithObject:)]) {
        [(id<NICell>)cell shouldUpdateCellWithObject:[(DXCellModel*)object object]];
    }
    
    return cell;
}

#pragma mark -
#pragma mark DXCellModelDelegate

-(Class) classForCellModelWithIndexPath:(NSIndexPath *)indexPath {
    // need to override in subclasses
    return nil;
}


@end



