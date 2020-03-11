//
//  ViewController.m
//  ToDoList
//
//  Created by ITHS on 2020-03-10.
//  Copyright © 2020 ITHS. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "AddItemViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, AddItemVCDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"To-do list";
    self.list = [[NSMutableArray alloc]init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell){
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    }

    NSString *item = self.list[indexPath.row];
    cell.label.text = item;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigation = segue.destinationViewController;
    AddItemViewController *addVC = navigation.viewControllers[0];
    addVC.delegate = self;
}

-(void)didSaveNewItem:(NSString *)newItem {
    [self.list addObject:newItem];
    [self.tableView reloadData];
}

//DELETING ITEMS
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
   [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      [self.list removeObjectAtIndex:indexPath.row];
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    }
    [tableView endUpdates];
      
    }



@end
