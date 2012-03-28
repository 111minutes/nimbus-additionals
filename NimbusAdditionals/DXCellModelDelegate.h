//
//  DXCellModelDelegate.h
//  NimbusAdditionals
//
//  Created by Maxim Letushov on 3/28/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DXCellModelDelegate <NSObject>

@required
-(Class) classForCellModelWithIndexPath:(NSIndexPath *)indexPath;

@end
