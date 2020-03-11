//
//  AddItemViewController.h
//  ToDoList
//
//  Created by ITHS on 2020-03-10.
//  Copyright © 2020 ITHS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AddItemVCDelegate <NSObject>

-(void) didSaveNewItem:(NSString *)newItem;

@end

@interface AddItemViewController : UIViewController

@property(nonatomic, strong) id <AddItemVCDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cancelBtn:(id)sender;
- (IBAction)saveBtn:(id)sender;

@end

NS_ASSUME_NONNULL_END
