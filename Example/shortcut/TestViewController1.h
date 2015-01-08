//
//  TestViewController2.h
//  shortcut
//
//  Created by Chris Chares on 1/7/15.
//  Copyright (c) 2015 Chris Chares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shortcut.h"

@interface TestViewController1 : UIViewController <ShortcutParams>

- (void)setShortcutParams:(NSDictionary *)params;

@property (weak, nonatomic) IBOutlet UITextView *textField;

@end
