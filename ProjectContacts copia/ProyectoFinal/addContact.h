//
//  addContact.h
//  ProyectoFinal
//
//  Created by Abner Abbey on 20/02/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface addContact : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIActionSheetDelegate >

@property (weak, nonatomic) IBOutlet UITextField *nameFieldAdd;
@property (weak, nonatomic) IBOutlet UITextField *phoneFieldAdd;
@property (weak, nonatomic) IBOutlet UITextField *streetFieldAdd;
@property (weak, nonatomic) IBOutlet UITextField *colFieldAdd;
@property (weak, nonatomic) IBOutlet UITextField *cpFieldAdd;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewAdd;
- (IBAction)imageActionAdd:(UITapGestureRecognizer *)sender;
- (IBAction)saveContact:(UIButton *)sender;
- (IBAction)hideKeyboard:(UITapGestureRecognizer *)sender;
- (IBAction)cancelar:(UIButton *)sender;



@end
