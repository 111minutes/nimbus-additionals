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

- (Class)cellClassForObject:(id)object {
    Class objectClass = [object class];
    Class cellClass = [self.objectToCellMap objectForKey:objectClass];
    
    return cellClass;
}

@end
