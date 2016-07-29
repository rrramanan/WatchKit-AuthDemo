//
//  breifController.m
//  logDemo
//
//  Created by Vinod Ramanathan on 27/07/16.
//  Copyright © 2016 Vinod Ramanathan. All rights reserved.
//

#import "breifController.h"

@interface breifController ()

@end

@implementation breifController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    [_breifLAbel setText:context];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



