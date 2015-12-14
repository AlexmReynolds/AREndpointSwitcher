//
//  AREEndpointsTableViewController.m
//  Pods
//
//  Created by Alex M Reynolds on 12/14/15.
//
//

#import "AREEndpointsTableViewController.h"

@interface AREEndpointsTableViewController ()
@property (nonatomic, strong) UIButton *saveButton;
@end

@implementation AREEndpointsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(self.selectedEndpoint){
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[self indexOfSelectedEndpoint] inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)indexOfSelectedEndpoint
{
    NSString *selected = self.selectedEndpoint;
    return [self.options indexOfObject:selected];
}

#pragma mark - Table view data source
- (UIButton *)saveButton
{
    if(_saveButton == nil){
        _saveButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
        _saveButton.backgroundColor = [UIColor colorWithRed:(104.0/255.0) green:(153.0/255.0) blue:(22.0/255.0) alpha:1.0];
        [_saveButton setTitle:NSLocalizedString(@"Save", @"save button title") forState:UIControlStateNormal];
        [_saveButton addTarget:self action:@selector(savePressed) forControlEvents:UIControlEventTouchUpInside];    }
    return _saveButton;
}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
- (UIView *)inputAccessoryView
{
    return self.saveButton;
}

- (void)savePressed
{
    if([self.owner respondsToSelector:@selector(endPointSelected:)]){
        [self.owner endPointSelected:self.selectedEndpoint];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.options.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.options objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *obj = [self.options objectAtIndex:indexPath.row];
    self.selectedEndpoint = obj;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
