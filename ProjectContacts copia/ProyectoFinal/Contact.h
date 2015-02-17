//
//  Contact.h
//  ProyectoFinal
//
//  Created by Abner Abbey on 20/02/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * telefono;
@property (nonatomic, retain) NSString * calle;
@property (nonatomic, retain) NSString * colonia;
@property (nonatomic, retain) NSNumber * codigop;
@property (nonatomic, retain) NSData * foto;

@end
