//
//  MainViewController.m
//  ProyectoFinal
//
//  Created by Abner Abbey on 20/02/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "Contact.h"
#import "CellContactController.h"
#import "ViewContact.h"

@interface MainViewController ()
@property (nonatomic, strong)NSArray *arrayContacts;

@end

@implementation MainViewController

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
	// Do any additional setup after loading the view.
    self.visorContacts.delegate = self;
    self.visorContacts.dataSource = self;
}

-(void)viewDidAppear:(BOOL)animated
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.arrayContacts = [appDelegate getAllContacts];
    [self.visorContacts reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayContacts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    CellContactController *celda = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    Contact *contacto = [self.arrayContacts objectAtIndex:indexPath.row];
    celda.nameContactInCell.text = contacto.nombre;
    celda.phoneContactInCell.text = [NSString stringWithFormat:@"%@", contacto.telefono];
    celda.imageContactInCell.image = [UIImage imageWithData:contacto.foto];
    return celda;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"detail"])
    {
        ViewContact *paso = [segue destinationViewController];
        
        AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        NSIndexPath *path = [self.visorContacts indexPathForSelectedRow];
        long row = path.row;
        self.arrayContacts = [appDelegate getAllContacts];
        Contact *contact = [appDelegate.getAllContacts objectAtIndex:row];
        paso.nombre = contact.nombre;
        paso.telefono = [NSString stringWithFormat:@"%@", contact.telefono];
        paso.calle = contact.calle;
        paso.colonia = contact.colonia;
        paso.codigop = [NSString stringWithFormat:@"%@", contact.codigop];
        paso.pictureContact = [UIImage imageWithData:contact.foto];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
