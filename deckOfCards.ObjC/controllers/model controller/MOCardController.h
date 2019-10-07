//
//  MOCardController.h
//  deckOfCards.ObjC
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MOCard.h"


@interface MOCardController : NSObject

+ (MOCardController *)sharedController;

-(void)drawNewCard:(NSInteger)numberOfCards completion:(void (^) (NSArray <MOCard *> *))completion;

-(void)fetchImageFromCard:(MOCard *)card completion:(void (^)(UIImage *))completion;

@end
