//
//  MOCard.m
//  deckOfCards.ObjC
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOCard.h"

@implementation MOCard

- (instancetype)initWithCardSuit:(NSString *)suit image:(NSString *)image

{
    self = [super init];
    if (self)
    {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation MOCard (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * suit = dictionary[@"suit"];
    NSString * image = dictionary[@"image"];
    
    return [self initWithCardSuit:suit image:image];
}

@end
