//
//  ViewController.h
//  HttpClientToy
//
//  Created by Tedi Fibri on 3/20/13.
//  Copyright (c) 2013 tediscript. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate>

@property (strong, nonatomic) NSMutableData *receivedData;

@end
