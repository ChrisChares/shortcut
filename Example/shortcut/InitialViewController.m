//
//  SCTViewController.m
//  shortcut
//
//  Created by Chris Chares on 01/07/2015.
//  Copyright (c) 2014 Chris Chares. All rights reserved.
//

#import "InitialViewController.h"
#import "Shortcut.h"

@implementation InitialViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *vcString = cell.textLabel.text;
    openURL(vcString);
}
@end
