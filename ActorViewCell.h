//
//  ActorViewCell.h
//  Comi
//
//  Created by mao on 7/12/17.
//  Copyright © 2017 iComico. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ActorViewCellDelegate <NSObject>

-(void)openActorHomePage:(NSInteger)actorId;

@end

@interface ActorViewCell : UITableViewCell

@property (nonatomic, weak) id<ActorViewCellDelegate> delegate;

+(ActorViewCell*)actorViewCell:(id)owner;

+(CGFloat)cellHeight;

+(NSString*)identifier;

-(void)fillActorInfo:(NSArray*)infos;


@end
