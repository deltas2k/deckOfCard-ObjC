//
//  MOCard.m
//  deckOfCards.ObjC
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOCard.h"

@implementation MOCard
///create a instance type function, we start by defining what we want returned, external parameter name / function name, followed by type declaration and pointer in memory, this is followed by our internal name for each parameter and then we open the scope.
- (instancetype)initWithCardSuit:(NSString *)suit image:(NSString *)image

{
    /// almost everything in obj c is a class, when creating your own class, it is a subclass of NSObject, so we need to initialize the superclass first
    self = [super init];
    /// if self is not nil, then initialize with our properties
    if (self)
    {
        /// self.suit = suit
        _suit = suit;
        /// self.image = image
        _image = image;
    }
    return self;
}

@end
/// extension on our card
@implementation MOCard (JSONConvertable)
/// 1. "-" instance method
/// 2. "(any)" - what we are returning
/// 3. "initWithDictionary:" - external name for our first parameter
/// 4. (NSDictionary<id,id> *" - type declaration
/// 5. NSDictionary<NSString *,id> - define the types for the key "NSString" and value "id" (aka any) of our dictionary
/// 6. "*" - pointer in memory
/// 7. "dictionary" - internal name for our parameter
- (MOCard *)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * suit = dictionary[@"suit"];
    NSString * image = dictionary[@"image"];
    
    return [self initWithCardSuit:suit image:image];
}

@end
