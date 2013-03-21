//
//  ViewController.m
//  HttpClientToy
//
//  Created by Tedi Fibri on 3/20/13.
//  Copyright (c) 2013 tediscript. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize receivedData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //call doRequst on load
    [self doRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void) doRequest {

        NSString *blogURL = @"http://blog.teamtreehouse.com/api/get_recent_summary/";
    // Create the request.
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:blogURL]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    // create the connection with the request
    // and start loading the data
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        
        //receivedData = [[NSMutableData data] retain];
        if(receivedData == nil) {
            receivedData = [[NSMutableData alloc] init];
        }
    } else {
        // Inform the user that the connection failed.
    }
}

//implement method
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    // receivedData is an instance variable declared elsewhere.
    
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.

    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // received Data, parse jsonData to NSDictionary and log to console

    NSError *error;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:&error];
    
    NSLog(@"%@", dataDictionary);
}

@end
