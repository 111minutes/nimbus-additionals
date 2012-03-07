//
//  DXCellFactory.h
//  NimbusAdditionals
//
//  Created by Sergey Zenchenko on 3/7/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import "NICellFactory.h"

@interface DXCellFactory : NICellFactory

- (Class)cellClassForObject:(id)object;

@end
