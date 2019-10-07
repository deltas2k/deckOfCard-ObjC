//
//  MOCard.h
//  deckOfCards.ObjC
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOCard : NSObject

@property (nonatomic, copy, readonly) NSString * suit;
@property (nonatomic, copy, readonly) NSString * image;

- (instancetype)initWithCardSuit:(NSString *)suit
                           image:(NSString *)image;



@end

@interface MOCard (JSONConvertable)
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;


@end

NS_ASSUME_NONNULL_END
