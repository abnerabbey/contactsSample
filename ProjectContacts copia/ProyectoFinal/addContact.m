//
//  addContact.m
//  ProyectoFinal
//
//  Created by Abner Abbey on 20/02/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import "addContact.h"
#import "AppDelegate.h"
#import "Contact.h"
#import "MainViewController.h"

@interface addContact ()
{
    MainViewController *refresh;
}

@property (nonatomic, retain)NSManagedObjectContext *context;
@property (nonatomic, strong)UIImagePickerController *accessToPhotos;
@property (nonatomic, strong)UIActionSheet *actionToPhotos;

@end

@implementation addContact

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
    
    refresh = [[MainViewController alloc]init];
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    self.context = appdelegate.managedObjectContext;
    self.accessToPhotos = [[UIImagePickerController alloc]init];
    self.accessToPhotos.delegate = self;
    
    self.actionToPhotos = [[UIActionSheet alloc]initWithTitle:@"Selecciona photo" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Cámara",@"Photo Library", nil];
    
    self.nameFieldAdd.delegate = self;
    self.phoneFieldAdd.delegate = self;
    self.streetFieldAdd.delegate = self;
    self.colFieldAdd.delegate = self;
    self.cpFieldAdd.delegate = self;
    self.phoneFieldAdd.keyboardType = UIKeyboardTypeNumberPad;
    self.cpFieldAdd.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animatedTextField:textField up:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animatedTextField:textField up:NO];
}

- (void)animatedTextField:(UITextField *)textField up:(BOOL)up
{
    int animatedDistance;
    int moveUpValue = textField.frame.origin.y + textField.frame.size.height;
    UIInterfaceOrientation orientacion = [[UIApplication sharedApplication]statusBarOrientation];
    if(orientacion == UIInterfaceOrientationPortrait || orientacion == UIInterfaceOrientationPortraitUpsideDown)
        animatedDistance = 216 - (460 - moveUpValue - 5);
    else
        animatedDistance = 162 - (30 - moveUpValue - 5);
    if(animatedDistance > 0)
    {
        const int movementDistance = animatedDistance;
        const float movementDuration = 0.3;
        int movement = (up ? -movementDistance : movementDistance);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:movementDuration];
        self.view.frame= CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        self.accessToPhotos.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.accessToPhotos animated:YES completion:nil];
    }
    else if(buttonIndex == 1)
    {
        self.accessToPhotos.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.accessToPhotos animated:YES completion:nil];
    }
}

- (IBAction)imageActionAdd:(UITapGestureRecognizer *)sender
{
    [self.actionToPhotos showInView:self.view];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.imageViewAdd setImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveContact:(UIButton *)sender
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:self.context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(nombre like '%@')", self.nameFieldAdd.text];
    [request setPredicate:predicate];
    NSError *error = nil;
    NSArray *arreglo = [self.context executeFetchRequest:request error:&error];
    if(arreglo.count >0)
    {
        UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Este contacto ya existe" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertview show];
    }
    else
    {
        Contact *nuevo = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:self.context];
        nuevo.nombre = self.nameFieldAdd.text;
        nuevo.telefono = [NSNumber numberWithInt:self.phoneFieldAdd.text.integerValue];
        nuevo.calle = self.streetFieldAdd.text;
        nuevo.colonia = self.colFieldAdd.text;
        nuevo.codigop = [NSNumber numberWithInt:self.cpFieldAdd.text.integerValue];
        NSData *imageData = UIImagePNGRepresentation(self.imageViewAdd.image);
        nuevo.foto = imageData;
        NSError *error = nil;
        if(![self.context save:&error])
        {
            UIAlertView *errorview = [[UIAlertView alloc]initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [errorview show];
        }
        else
            [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Tu contacto ha sido guardado" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [view show];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)hideKeyboard:(UITapGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}

- (IBAction)cancelar:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
