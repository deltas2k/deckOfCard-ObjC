//
//  MOCardController.m
//  deckOfCards.ObjC
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOCardController.h"

@implementation MOCardController

/// + defines this as a class method, similar to a static func
/// return with our card controller
/// * pointer in memory for our card controller
/// sharedController is our internal parameter name
+(MOCardController *)sharedController
{
    ///make sure our sharedController doesn't exist
    static MOCardController * sharedController = nil;
    /// create a once token to keep track of how many times this function has been run, this is done on the dispatch once thread
    static dispatch_once_t onceToken;
    /// method that takes in our once from above and runs a completion to allocate and initialize a MOCardController
    dispatch_once(&onceToken, ^{
        sharedController = [MOCardController new];
    });
    return sharedController;
}
/// defines a constant for our baseURL with a string literal
static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new";

-(void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<MOCard *> *))completion
{
    /// defines variable for our url, uses bracket syntax versus dot syntax
    NSURL * url = [NSURL URLWithString:baseURLString];
    NSString * cardCount = [@(numberOfCards) stringValue];
    NSURL * drawURL = [url URLByAppendingPathComponent:@"draw/"];
    
    NSURLComponents * urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem * queryItem = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    NSURL * finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"there was an error in %s: %@,%@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            /// defining variable and allocating in memory for our topLevelDictionary, calling our JSONSerialization method with get an object with data, 2 represents "allow fragments" for our reading options "&error'" refers to the same spot in memory as error from data task
            NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            /// if you cannot get a dictionary out of the data
            if (!topLevelDictionary)
            {
                NSLog(@"error parsing the JSON %@", error);
                completion(nil);
                return;
            }
            ///define a variable of type NSArray at the key "cards" from our top level dictionary
            NSArray * cardsArray = topLevelDictionary[@"cards"];
            /// defining a placeholder variable that is declared as mutable that we can later append to it
            NSMutableArray * cardPlaceholder = [NSMutableArray new];
            
            for (NSDictionary * dictionary in cardsArray)
            {
                MOCard * card = [[MOCard alloc] initWithDictionary:dictionary];
                [cardPlaceholder addObject:card];
            }
            completion(cardPlaceholder);
        }
    }]resume];
}

-(void)fetchImageFromCard:(MOCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL * imageURL = [NSURL URLWithString:card.image];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"error: %@,%@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@",response);
        }
        if (data)
        {
            UIImage * image = [UIImage imageWithData:data];
            completion(image);
        }
    }] resume];
}

@end
