//
//  ViewContact.m
//  ProyectoFinal
//
//  Created by Abner Abbey on 20/02/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import "ViewContact.h"

@interface ViewContact ()

@end

@implementation ViewContact

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Llegó aquí");
    
    self.nameContactDetail.text = self.nombre;
    self.phoneNameDetail.text = self.telefono;
    self.streetContactDetail.text = self.calle;
    self.colContactDetail.text = self.colonia;
    self.codigoContactDetail.text = self.codigop;
    self.imageContactDetail.image = self.pictureContact;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aceptarView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
