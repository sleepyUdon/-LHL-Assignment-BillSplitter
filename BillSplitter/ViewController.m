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

@property (weak, nonatomic) IBOutlet UILabel *numberOfPeople;

@property (weak, nonatomic) IBOutlet UILabel *amountToPayLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBillAmountField];
    [self customizeKeyboard];
    [self.numberOfPeopleSlider addTarget:self action:@selector(outputSlider:) forControlEvents:UIControlEventValueChanged];

    [self outputSlider:self.numberOfPeopleSlider];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma set up

-(void) setupBillAmountField{
    self.totalBillAmountTextField.placeholder = @"Type bill amount";
}



-(void) setSlider {
    self.numberOfPeopleSlider.minimumValue = 1;
    self.numberOfPeopleSlider.maximumValue = 7;
    self.numberOfPeopleSlider.value = 5;
}


#pragma action

- (IBAction)calculateSplitAmount:(id)sender {
    NSDecimalNumber * amountToPay= [NSDecimalNumber decimalNumberWithString: _totalBillAmountTextField.text];
    
    NSDecimalNumber *divisor = [NSDecimalNumber decimalNumberWithMantissa:_numberOfPeopleSlider.value exponent:0 isNegative:NO];
    NSDecimalNumber *contribution = [amountToPay decimalNumberByDividingBy:divisor];

    _amountToPayLabel.text = contribution.stringValue;
}



-(void) customizeKeyboard{
    self.totalBillAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
}

- (void)outputSlider:(UISlider *)sender {
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:0];

    
    self.numberOfPeople.text = [NSString stringWithFormat:@"%@", [formatter stringFromNumber: [NSNumber numberWithFloat:self.numberOfPeopleSlider.value]]];
}

#pragma mark - Handle Gestures

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.totalBillAmountTextField isFirstResponder]) {
        [self.totalBillAmountTextField resignFirstResponder];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)totalBillAmountTextField {
    [totalBillAmountTextField resignFirstResponder];
    return YES;
}

@end
