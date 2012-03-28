//
//  DXCellDelegate.h
//  NimbusAdditionals
//
//  Created by Maxim Letushov on 3/28/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DXCellModel.h"

@protocol DXCellDelegate <NSObject>

- (Class)cellModelClass;
- (BOOL)shouldUpdateCellWithModel:(DXCellModel*) model;

+ (CGFloat)cellHeightWithModel:(DXCellModel*) model atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;

@end
