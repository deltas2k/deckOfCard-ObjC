//
//  MOViewController.m
//  deckOfCards.ObjC
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOViewController.h"
#import "MOCardController.h"
#import "MOCard.h"

@interface MOViewController ()

@end

@implementation MOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    /// calling our draw card fuction on our shared instance, we added an internal name for the array that we completed with and used that array to fetch an image by passing in the first card in the array to our fetch image method. (after pointers)
    [MOCardController.sharedController drawNewCard:1 completion:^(NSArray<MOCard *> * cardArray) {
        [MOCardController.sharedController fetchImageFromCard:cardArray[0] completion:^(UIImage * image) {
            /// same as dispatchqueue.main.async
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
                MOCard * card = cardArray[0];
                self.suitLabel.text = card.suit;
            });
        }];
    }];
}
@end
