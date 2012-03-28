//
//  DXTableViewModel.h
//  NimbusAdditionals
//
//  Created by Sergey Zenchenko on 3/7/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import "NITableViewModel.h"
#import "DXCellModelDelegate.h"
#import "DXCellModel.h"

@interface DXTableViewModel : NITableViewModel

@property (nonatomic, strong) id<DXCellModelDelegate> cellModelDelegate;

- (DXCellModel *)getCellModelAtIndexPath:(NSIndexPath *)indexPath;
- (void)setCellModel:(DXCellModel *)cellModel atIndexPath:(NSIndexPath *)indexPath;

@end
