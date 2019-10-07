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
    [MOCardController.sharedController drawNewCard:1 completion:^(NSArray<MOCard *> * cardArray) {
        [MOCardController.sharedController fetchImageFromCard:cardArray[0] completion:^(UIImage * image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
                MOCard * card = cardArray[0];
                self.suitLabel.text = card.suit;
            });
        }];
    }];
}
@end
