//
//  ViewController.m
//  QMUI_Demo
//
//  Created by Cer on 2019/11/29.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <QMUITextFieldDelegate>


/*  **/
@property (nonatomic, strong) void(^testBlock)();

/*  **/
@property (nonatomic, strong) QMUITextField *tf;


@property(nonatomic, strong) NSString *smartMac;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"songhongkang1111";
    label1.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:label1];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(20);
    }];
    
 
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"songhsong";
    label2.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:label2];

    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label1).offset(0);
        make.left.equalTo(label1.mas_right).offset(20);
        make.right.mas_equalTo(0);
    }];
    
    [label2 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];

     [label2 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];

}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSLog(@"1111111");
//    return YES;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.tf.text = @"songhongkang";
}


- (void)fetch
{
//    [[[self fetchA] flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
//        NSLog(@"value---:%@",value);
//        return [self fetchB];
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x---:%@",x);
//    } error:^(NSError * _Nullable error) {
//
//    } completed:^{
//
//    }];
//    [[[self fetchA] zipWith:[self fetchB]] subscribeNext:^(id  _Nullable x) {
//
//    } error:^(NSError * _Nullable error) {
//
//    } completed:^{
//
//    }];
    
    [[[self fetchA] filter:^BOOL(id  _Nullable value) {
        return [value intValue] != 1;
    }] subscribeNext:^(id  _Nullable x) {
        
    } error:^(NSError * _Nullable error) {
        
    } completed:^{
        
    }];
}

- (RACSignal *)fetchA
{
   return  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
     
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@1];
            [subscriber sendCompleted];
            [subscriber sendError:nil];
        });
        return nil;
    }];
}

- (RACSignal *)fetchB
{
  return  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
     
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@2];
            [subscriber sendCompleted];
        });
        return nil;
    }];
}

@end
