//
//  ViewController.m
//  TestForTransition
//
//  Created by Shane on 2020/6/19.
//  Copyright © 2020 Shane. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"

#import "Animator.h"

#import "NSArray+ArrayDescription.h"

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willTerminate:) name:UIApplicationWillTerminateNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"---- %s", __func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"---- %s", __func__);
}

- (IBAction)pushAction:(UIButton *)sender {
    SecondController *secondVC = [[SecondController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (IBAction)presentAction:(UIButton *)sender {
    /**
     typedef NS_ENUM(NSInteger, UIModalPresentationStyle) {
         UIModalPresentationFullScreen = 0,
         UIModalPresentationPageSheet API_AVAILABLE(ios(3.2)) API_UNAVAILABLE(tvos),
         UIModalPresentationFormSheet API_AVAILABLE(ios(3.2)) API_UNAVAILABLE(tvos),
         UIModalPresentationCurrentContext API_AVAILABLE(ios(3.2)),
         UIModalPresentationCustom API_AVAILABLE(ios(7.0)),
         UIModalPresentationOverFullScreen API_AVAILABLE(ios(8.0)),
         UIModalPresentationOverCurrentContext API_AVAILABLE(ios(8.0)),
         UIModalPresentationPopover API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(tvos),
         UIModalPresentationBlurOverFullScreen API_AVAILABLE(tvos(11.0)) API_UNAVAILABLE(ios) API_UNAVAILABLE(watchos),
         UIModalPresentationNone API_AVAILABLE(ios(7.0)) = -1,
         UIModalPresentationAutomatic API_AVAILABLE(ios(13.0)) = -2,
     };
     */
    
    SecondController *secondVC = [[SecondController alloc] init];
    secondVC.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:secondVC animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return [Animator new];
    }
    
    return nil;
}

- (void)willTerminate:(NSNotification *)noti {
    NSDictionary *dict = noti.userInfo;
    NSLog(@"%s-%@", __func__, dict);
}

@end
