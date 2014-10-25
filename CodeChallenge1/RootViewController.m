//
//  ViewController.m
//  CodeChallenge1
//
//  Created by CHRISTINA GUNARTO on 10/23/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *leftNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *rightNumberTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightNavButton;
@property int resultNumber;
@property (weak, nonatomic) NSString *resultString;


@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.rightNavButton.enabled = NO;
}

- (IBAction)calculateButtonPressed:(id)sender
{
    int leftNumber = [self.leftNumberTextField.text intValue];
    int rightNumber = [self.rightNumberTextField.text intValue];

    self.resultNumber = leftNumber * rightNumber;
    self.resultString = [NSString stringWithFormat:@"%d", self.resultNumber];
    self.title = self.resultString;

    if (self.resultNumber % 5 == 0)
    {
        self.rightNavButton.enabled = YES;
    }
    else
    {
        self.rightNavButton.enabled = NO;
    }

    // Hacky way of getting rid of keyboard... need to change this after code below is fixed
    [self.leftNumberTextField resignFirstResponder];
    [self.rightNumberTextField resignFirstResponder];

}

//!!! NEED TO come bac to this code later to see how to resign keyboard with delegation
// code below isn't right, needs to be redone
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [textField resignFirstResponder];
//    return NO;
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // passing the result of the multiplication to the webVC's title
    WebViewController *webVC = segue.destinationViewController;
    webVC.title = self.resultString;
}







@end
