//
//  DXCellFactory.h
//  NimbusAdditionals
//
//  Created by Sergey Zenchenko on 3/7/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import "NICellFactory.h"
#import "DXCellFactroryDelegate.h"
#import "DXCellModelDelegate.h"

@interface DXCellFactory : NICellFactory <DXCellModelDelegate>

- (Class)cellClassForObject:(id)object;

+ (UITableViewCell *)cellWithClass:(Class)cellClass
                         tableView:(UITableView *)tableView
                            object:(id)object;

@property (nonatomic, strong) id<DXCellFactroryDelegate> delegate;

@end
