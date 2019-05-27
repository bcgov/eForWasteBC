//
//  UIViewController+BackButtonHandler.m
//  WasteMobile
//
//  Created by Jack Wong on 2014-10-20.
//  Copyright (c) 2014 Salus Systems. All rights reserved.
//

#import "UIViewController+BackButtonHandler.h"

@implementation UIViewController (BackButtonHandler)

@end

@implementation UINavigationController (ShouldPopOnBackButton)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    
	if([self.viewControllers count] < [navigationBar.items count]) {
		return YES;
	}
    
	BOOL shouldPop = YES;
	UIViewController* vc = [self topViewController];
	if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
		shouldPop = [vc navigationShouldPopOnBackButton];
	}
    
	if(shouldPop) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[self popViewControllerAnimated:YES];
		});
	} else {

		for(UIView *subview in [navigationBar subviews]) {
			if(subview.alpha < 1.) {
				[UIView animateWithDuration:.25 animations:^{
					subview.alpha = 1.;
				}];
			}
		}
	}
    
	return NO;
}

@end
