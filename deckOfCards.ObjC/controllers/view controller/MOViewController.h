//
//  MOViewController.h
//  deckOfCards.ObjC
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *suitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)buttonClicked:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
