//
//  DXTableViewModel.m
//  NimbusAdditionals
//
//  Created by Sergey Zenchenko on 3/7/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import "DXTableViewModel.h"

@interface DXTableViewModel () <UITableViewDataSource, UITableViewDelegate>


@end


@implementation DXTableViewModel

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0.0f;
}

@end
