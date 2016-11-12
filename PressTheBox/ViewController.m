//
//  ViewController.m
//  PressTheBox
//
//  Created by LILouis on 11/8/16.
//  Copyright © 2016 LILouis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *box_one_pics;
NSArray *box_two_pics;
NSArray *box_three_pics;
NSInteger box_one_state = -1;
NSInteger box_two_state = -1;
NSInteger box_three_state = -1;
NSInteger game_status = 1;

UIButton *box_one;
UIButton *box_two;
UIButton *box_three;
UILabel *title_label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    box_one_pics = @[[UIImage imageNamed: @"1a.png"], [UIImage imageNamed: @"2a.png"],[UIImage imageNamed: @"3a.png"]];
    
    box_two_pics = @[[UIImage imageNamed: @"1b.png"], [UIImage imageNamed: @"2b.png"],[UIImage imageNamed: @"3b.png"]];
    
    box_three_pics = @[[UIImage imageNamed: @"1c.png"], [UIImage imageNamed: @"2c.png"],[UIImage imageNamed: @"3c.png"]];
    
    box_one = [UIButton buttonWithType:UIButtonTypeCustom];
    [box_one setTitle: @"" forState: UIControlStateNormal];
    [box_one.layer setBorderWidth:3.0];
    box_one.bounds = CGRectMake(0, 0, 140, 44);
    box_one.center = CGPointMake(320.0 / 2, 240);
    box_one.tag = 1;
    [box_one addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:box_one];
    
    box_two = [UIButton buttonWithType:UIButtonTypeCustom];
    [box_two setTitle: @"" forState: UIControlStateNormal];
    [box_two.layer setBorderWidth:3.0];
    box_two.bounds = CGRectMake(0, 0, 140, 44);
    box_two.center = CGPointMake(320.0 / 2, 285);
    box_two.tag = 2;
    [box_two addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:box_two];
    
    box_three = [UIButton buttonWithType:UIButtonTypeCustom];
    [box_three setTitle: @"" forState: UIControlStateNormal];
    [box_three.layer setBorderWidth:3.0];
    box_three.bounds = CGRectMake(0, 0, 140, 44);
    box_three.center = CGPointMake(320.0 / 2, 330);
    box_three.tag = 3;
    [box_three addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:box_three];
    
    UIButton *restart_button = [UIButton buttonWithType:UIButtonTypeCustom];
    [restart_button setTitle: @"New Game" forState: UIControlStateNormal];
    [restart_button.layer setBorderWidth:3.0];
    restart_button.bounds = CGRectMake(0, 0, 140, 44);
    restart_button.center = CGPointMake(320.0 / 2, 400);
    restart_button.tag = 4;
    [restart_button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:restart_button];
    
    title_label = [ [UILabel alloc ] initWithFrame:CGRectMake(0, 0.0, 150.0, 43.0) ];
    title_label.center = CGPointMake(320.0 / 2, 200);
    title_label.textAlignment =  UITextAlignmentCenter;
    title_label.text = @"Press the box";
    [self.view addSubview:title_label];
}

- (void) buttonTouchUpInside:(UIButton *)button {
    
    NSInteger random_num = arc4random_uniform(3);
    
    if (button.tag == 1) {
        [button setBackgroundImage:box_one_pics[random_num] forState:UIControlStateNormal];
        box_one_state = random_num;
        [self checkWin];
    } else if (button.tag == 2) {
        [button setBackgroundImage:box_two_pics[random_num] forState:UIControlStateNormal];
        box_two_state = random_num;
        [self checkWin];
    } else if (button.tag == 3) {
        [button setBackgroundImage:box_three_pics[random_num] forState:UIControlStateNormal];
        box_three_state = random_num;
        [self checkWin];
    } else if (button.tag == 4) {
        [self reset];
    }
    
}

- (void) reset {
    [box_one setBackgroundImage:nil forState:UIControlStateNormal];
    [box_two setBackgroundImage:nil forState:UIControlStateNormal];
    [box_three setBackgroundImage:nil forState:UIControlStateNormal];
    box_three_state = -1;
    box_two_state = -1;
    box_one_state = -1;
    title_label.text = @"Press the box";
    game_status = 1;
}

- (void) checkWin {
    if(game_status == 1 && box_one_state == box_two_state && box_two_state == box_three_state) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You win!"
                                                        message:@"Easy!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        title_label.text = @"You Win!";
        game_status = 0;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
