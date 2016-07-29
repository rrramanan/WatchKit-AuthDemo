//
//  InterfaceController.m
//  logDemo WatchKit Extension
//
//  Created by Vinod Ramanathan on 27/07/16.
//  Copyright © 2016 Vinod Ramanathan. All rights reserved.
//

#import "InterfaceController.h"
#import "rowController.h"

@interface InterfaceController()

@end


@implementation InterfaceController
NSString *mail;
NSString *pass;
NSMutableArray *loadItem;
BOOL state;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
       
    state = FALSE;
    
    loadItem = [[NSMutableArray alloc]initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five", nil];
    
    [_Table setNumberOfRows:[loadItem count] withRowType:@"rowID"];
    
    for (int i=0; i < [loadItem count]; i++) {
        
        NSString *get = [loadItem objectAtIndex:i];
        
        rowController *rvc = [_Table rowControllerAtIndex:i];
        
        [rvc.tabLabel setText:get];
        
    }
    
    [_Table setHidden:TRUE];
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (IBAction)mail {
    
    NSArray *arr = [NSArray arrayWithObjects:@"test@mail.com",@"arm@mail.com", nil];
    
    
    [self presentTextInputControllerWithSuggestions:arr allowedInputMode:WKTextInputModePlain completion:^(NSArray *array){
        
        if (array != nil) {
            
            for (int i=0; i<[array count]; i++) {
                
                mail = [array objectAtIndex:0];
                
                [_label setText:mail];
            }
            
        }
        
    }];
    
   

}

- (IBAction)password {
    
    NSArray *arr = [NSArray arrayWithObjects:@"123",@"OS#3beta", nil];
    
    
    [self presentTextInputControllerWithSuggestions:arr allowedInputMode:WKTextInputModePlain completion:^(NSArray *array){
        
        if (array != nil) {
            
            for (int i=0; i<[array count]; i++) {
                
                pass = [array objectAtIndex:0];
                
                [_label1 setText:@"*****"];
            }
            
        }

    }];

    
}

- (IBAction)LogIn {
    
    
    if ([mail isEqualToString:@"test@mail.com"] && [pass isEqualToString:@"123"]) {
        
        mail= nil;  pass= nil;  [_label setText:@"Mail ID"];  [_label1 setText:@"Password"];
        
        WKAlertAction *act = [WKAlertAction actionWithTitle:@"Ok" style:WKAlertActionStyleCancel handler:^(void){
            
            state = TRUE;
            [_Table setHidden:FALSE];
            [_log_group setHidden:TRUE];
            [self didAppear];
            
        }];
        
        [self presentAlertControllerWithTitle:@"Welcome" message:@"Verifed" preferredStyle:WKAlertControllerStyleAlert actions:@[act]];
        
    }
    
    else{
        
        mail=nil;  pass=nil;  [_label setText:@"Mail ID"];  [_label1 setText:@"Password"];
        
        WKAlertAction *act = [WKAlertAction actionWithTitle:@"Ok" style:WKAlertActionStyleCancel handler:^(void){
        }];
        
        [self presentAlertControllerWithTitle:@"Wrong" message:@"Unverifed" preferredStyle:WKAlertControllerStyleAlert actions:@[act]];
        
    }
    
    
    
}


-(id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex{
    
    if ([segueIdentifier isEqualToString:@"viewTwo"]) {
        
        return loadItem[rowIndex];
        
    }
    return nil;
}


- (IBAction)logout {
    
   
    [_Table setHidden:TRUE];
    [_log_group setHidden:FALSE];
    state = FALSE;
    [self didAppear];
    
}


-(void)didAppear{
    [super didAppear];
    
    if (state == FALSE) {
    
        [self setTitle:@"Login"];
    
    }
    else{
    
        [self setTitle:@"Home"];
    
    }
    
}

@end



