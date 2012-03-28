//
//  DXTableViewModel.m
//  NimbusAdditionals
//
//  Created by Sergey Zenchenko on 3/7/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import "DXTableViewModel.h"
#import "DXCellModel.h"
#import "NITableViewModel+Private.h"

@interface DXTableViewModel () <UITableViewDataSource, UITableViewDelegate>

- (NSMutableArray *) createCellsModel:(NSArray *)objects;

@end


@implementation DXTableViewModel {
    NSMutableArray *_cellsModelArray;
}

@synthesize cellModelDelegate;

- (NSMutableArray *) createCellsModel:(NSArray *)objects {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:objects.count];
    int i = 0;
    for (id object in objects) {
        
        Class modelClass = nil;
        
        if ([self.cellModelDelegate respondsToSelector:@selector(classForCellModelWithIndexPath:)]) {
            modelClass = [self.cellModelDelegate classForCellModelWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        if (nil == modelClass) {
            modelClass = [DXCellModel class];
        }
        
        id cellModel = [[modelClass alloc] init];
        [cellModel setObject:object];
        [array addObject:cellModel];

        i++;
    }
    return array;
}

- (id)init {
    self = [super init];
    if (self) {
        _cellsModelArray = [NSMutableArray new];
    }
    return self;
}

- (void)_compileDataWithListArray:(NSArray *)listArray {
    [self _resetCompiledData];
    
    NITableViewModelSection* section = [NITableViewModelSection section];
    section.rows = [self createCellsModel:listArray];
    self.sections = [NSArray arrayWithObject:section];
}

- (DXCellModel *)getCellModelAtIndexPath:(NSIndexPath *)indexPath {
    NITableViewModelSection *section = [self.sections objectAtIndex:indexPath.section];
    return [section.rows objectAtIndex:indexPath.row];
}

- (void)setCellModel:(DXCellModel *)cellModel atIndexPath:(NSIndexPath *)indexPath {
    NITableViewModelSection *section = [self.sections objectAtIndex:indexPath.section];
    NSMutableArray *rows = [NSMutableArray arrayWithArray:section.rows];
    [rows replaceObjectAtIndex:indexPath.row withObject:cellModel];
}





@end
