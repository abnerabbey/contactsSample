//
//  ViewContact.h
//  ProyectoFinal
//
//  Created by Abner Abbey on 20/02/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewContact : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageContactDetail;
@property (weak, nonatomic) IBOutlet UILabel *nameContactDetail;
@property (weak, nonatomic) IBOutlet UILabel *phoneNameDetail;
@property (weak, nonatomic) IBOutlet UILabel *streetContactDetail;
@property (weak, nonatomic) IBOutlet UILabel *colContactDetail;
@property (weak, nonatomic) IBOutlet UILabel *codigoContactDetail;
@property (weak, nonatomic) IBOutlet UIButton *acceptButtonDetail;
- (IBAction)aceptarView:(UIButton *)sender;

@property (nonatomic, strong)NSString *nombre;
@property (nonatomic, strong)NSString *telefono;
@property (nonatomic, strong)NSString *calle;
@property (nonatomic, strong)NSString *colonia;
@property (nonatomic, strong)NSString *codigop;
@property (nonatomic, strong)UIImage *pictureContact;
@end
