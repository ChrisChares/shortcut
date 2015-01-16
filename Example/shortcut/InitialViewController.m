//
//  SCTViewController.m
//  shortcut
//
//  Created by Chris Chares on 01/07/2015.
//  Copyright (c) 2014 Chris Chares. All rights reserved.
//

#import "InitialViewController.h"
#import "Shortcut.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(secondVC)];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *vcString = cell.textLabel.text;
    openURL(vcString);
}



- (void)secondVC {
    openURL(@"testytaco123");
}

- (IBAction)goToNextVC:(id)sender {
    UIViewController *vc = [Shortcut load:@"/TestViewController1/?param1=Value1&param2=Value2"];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
