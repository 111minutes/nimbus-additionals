//
//  DXCellFactroryDelegate.h
//  NimbusAdditionals
//
//  Created by Maxim Letushov on 3/16/12.
//  Copyright (c) 2012 DIMALEX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DXCellFactroryDelegate <NSObject>

-(Class) classForCellWithIndexPath:(NSIndexPath*) indexPath;

@end
