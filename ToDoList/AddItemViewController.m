//
//  AddItemViewController.m
//  ToDoList
//
//  Created by ITHS on 2020-03-10.
//  Copyright © 2020 ITHS. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelBtn:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)saveBtn:(id)sender {
    [self.delegate didSaveNewItem:self.textField.text];
    [self dismissViewControllerAnimated:true completion:nil];
    
    
}
@end
