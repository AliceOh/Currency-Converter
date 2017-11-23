//
//  ViewController.m
//  CurrencyConverter
//
//  Created by wikigainoh on 21/11/17.
//  Copyright © 2017 HelloWorldCop. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currentA;
@property (weak, nonatomic) IBOutlet UILabel *currentB;
@property (weak, nonatomic) IBOutlet UILabel *currentC;

@end

@implementation ViewController
- (IBAction)buttonTapped:(id)sender
{
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies
{
    self.convertButton.enabled = YES;
    double inputValue = [self.inputField.text  floatValue];
    double euroValue = inputValue * currencies.EUR;
    self.currentA.text = [NSString stringWithFormat:@"%.2f", euroValue];
    
    double jpyValue = inputValue * currencies.JPY;
    self.currentB.text = [NSString stringWithFormat:@"%.2f", jpyValue];
    
    double gbpValue = inputValue * currencies.GBP;
    self.currentC.text = [NSString stringWithFormat:@"%.2f", gbpValue];}


@end
