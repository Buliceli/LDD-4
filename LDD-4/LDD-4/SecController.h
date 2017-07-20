//
//  SecController.h
//  LDD-4
//
//  Created by 李洞洞 on 20/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecControllerDelegate <NSObject>
- (void)secControllerDismiss;
@end
@interface SecController : UIViewController
@property(nonatomic,assign)id<SecControllerDelegate>delegate;
@end