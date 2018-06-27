//
//  ViewController.m
//  Tip Calculator
//
//  Created by Hannah Hsu on 6/26/18.
//  Copyright © 2018 Hannah Hsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UITextField *numPeopleField;
@property (weak, nonatomic) IBOutlet UILabel *perPersonLabel;
@property (weak, nonatomic) IBOutlet UILabel *numPeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *perPersonTitleLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tipTitleLabel setHidden:YES];
    [self.tipLabel setHidden:YES];
    [self.totalTitleLabel setHidden:YES];
    [self.totalLabel setHidden:YES];
    [self.tipControl setHidden:YES];
    [self.numPeopleField setHidden:YES];
    [self.perPersonLabel setHidden:YES];
    [self.numPeopleLabel setHidden:YES];
    [self.perPersonTitleLabel setHidden:YES];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    double tipPerPerson = tip / [self.numPeopleField.text doubleValue];
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    if([self.numPeopleField.text doubleValue] == 0 || [self.billField.text doubleValue] == 0){
        self.perPersonLabel.text = @"$0.00";
    }
    else{
        self.perPersonLabel.text = [NSString stringWithFormat:@"$%.2f", tipPerPerson];
    }
    
}
- (IBAction)numPeopleEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double tipPerPerson = tip / [self.numPeopleField.text doubleValue];
    if([self.numPeopleField.text doubleValue] == 0 || [self.billField.text doubleValue] == 0){
        self.perPersonLabel.text = @"$0.00";
    }
    else{
    self.perPersonLabel.text = [NSString stringWithFormat:@"$%.2f", tipPerPerson];
    }
}


- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        
        [self.tipTitleLabel setHidden:NO];
        [self.tipLabel setHidden:NO];
        [self.totalTitleLabel setHidden:NO];
        [self.totalLabel setHidden:NO];
        [self.tipControl setHidden:NO];
        [self.numPeopleField setHidden:NO];
        [self.perPersonLabel setHidden:NO];
        [self.numPeopleLabel setHidden:NO];
        [self.perPersonTitleLabel setHidden:NO];
    }];
}


@end
