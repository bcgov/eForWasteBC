//
//  PileEditTableViewCell.h
//  iForWaste
//
//  Created by Sweta Kutty on 2019-03-04.
//  Copyright © 2019 Salus Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PileTableViewCell.h"

@class WastePile;
@class PilePlotViewController;
@class WasteBlock;

@interface PileEditTableViewCell : PileTableViewCell
<UIAlertViewDelegate>

@property (weak, nonatomic) PilePlotViewController *pileView;

@property (strong, nonatomic) WastePile *cellWastePile;
@property (strong, nonatomic) WasteBlock *wasteBlock;

@property (strong, nonatomic) NSMutableDictionary *displayObjectDictionary;

-(void)bindCell:(WastePile *)wastePile wasteBlock:(WasteBlock *)wasteBlock userCreatedBlock:(BOOL)userCreatedBlock;

@end

