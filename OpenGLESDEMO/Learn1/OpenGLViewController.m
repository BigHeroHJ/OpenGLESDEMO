//
//  OpenGLViewController.m
//  OpenGLESDEMO
//
//  Created by XDS on 2018/1/8.
//  Copyright © 2018年 Lemon HOLL. All rights reserved.
//

#import "OpenGLViewController.h"
#import "learn1_view.h"

@interface OpenGLViewController ()
{
    learn1_view  *gl_view;
}
@end

@implementation OpenGLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    gl_view = [[learn1_view alloc] initWithFrame:self.view.frame];
    //[[UIApplication sharedApplication] keyWindow]
   [self.view addSubview:gl_view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
