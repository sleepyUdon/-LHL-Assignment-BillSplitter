//
//  ViewController.m
//  BillSplitter
//
//  Created by Viviane Chan on 2016-07-11.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *totalBillAmountTextField;

@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;


@property (weak, nonatomic) IBOutlet UILabel *amountToPayLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateSplitAmount:(id)sender {
    NSDecimalNumber * amountToPay= [NSDecimalNumber decimalNumberWithString: _totalBillAmountTextField.text];
    
    NSDecimalNumber *divisor = [NSDecimalNumber decimalNumberWithMantissa:_numberOfPeopleSlider.value exponent:0 isNegative:NO];
    NSDecimalNumber *contribution = [amountToPay decimalNumberByDividingBy:divisor];

    _amountToPayLabel.text = contribution.stringValue;

}

@end
