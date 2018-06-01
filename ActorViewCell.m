//
//  ActorViewCell.m
//  Comi
//
//  Created by mao on 7/12/17.
//  Copyright © 2017 iComico. All rights reserved.
//

#import "ActorViewCell.h"
#import "ActorInfoView.h"
#import "UserInfo.h"

@interface ActorViewCell(){
    ActorInfoView* _leftActorInfoView;
    ActorInfoView* _rightActorInfoView;
    
    NSArray* _actorInfoArray;
}

@end

@implementation ActorViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)prepareForReuse {
    [super prepareForReuse];
    _leftActorInfoView.hidden = YES;
    _rightActorInfoView.hidden = YES;
}


-(void)layoutSubviews  {
    [super layoutSubviews];
    CGFloat cellWidth = self.width;
    CGFloat w = floor((cellWidth - 6*3)/2);
    [_leftActorInfoView setLeft:6.0];
    [_leftActorInfoView setWidth:w];
    [_rightActorInfoView setLeft:_leftActorInfoView.right + 6];
    [_rightActorInfoView setWidth:w];
}


+(ActorViewCell*)actorViewCell:(id)owner{
    ActorViewCell* cell = [UIView viewWithNib:[ActorViewCell identifier] owner:owner];
    return cell;
}

+(CGFloat)cellHeight{
    return 134.0;
}

+(NSString*)identifier{
    return @"ActorViewCell";
}


-(void)fillActorInfo:(NSArray*)infos  {
    if( infos.count == 0 ) {
        return;
    }
    _actorInfoArray = infos;
    if( infos.count >= 1 ) {
        if( _leftActorInfoView == nil )  {
            _leftActorInfoView = [ActorInfoView actorInfoView:self];
            [self.contentView addSubview:_leftActorInfoView];
            [_leftActorInfoView setLeft:6.0];
            [_leftActorInfoView setTop:6.0];
            _leftActorInfoView.bgButton.tag = 0;
            [_leftActorInfoView.bgButton addTarget:self action:@selector(bgButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        ActorInfo* info = [infos objectAtIndex:0];
        [_leftActorInfoView setActorInfo:info];
        _leftActorInfoView.hidden = NO;
    }
    if( infos.count >= 2 )  {
        if( _rightActorInfoView == nil )  {
            _rightActorInfoView = [ActorInfoView actorInfoView:self];
            [self.contentView addSubview:_rightActorInfoView];
            [_rightActorInfoView setLeft:6.0];
            [_rightActorInfoView setTop:6.0];
            _rightActorInfoView.bgButton.tag = 1;
            [_rightActorInfoView.bgButton addTarget:self action:@selector(bgButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        ActorInfo* info = [infos objectAtIndex:1];
        [_rightActorInfoView setActorInfo:info];
        _rightActorInfoView.hidden = NO;
    }
    [self layoutSubviews];
}


#pragma mark -- buttonClick
-(void)bgButtonClick:(UIButton*)sender {
    NSInteger tag = sender.tag;
    if( tag >= _actorInfoArray.count ){
        assert(0);
    }
    ActorInfo* info = [_actorInfoArray objectAtIndex:tag];
    NSInteger actorId = info.actorId;
    if( _delegate && [_delegate respondsToSelector:@selector(openActorHomePage:)] ) {
        [_delegate openActorHomePage:actorId];
    }
}

// master insert line 1111111
//deveop insert line 1111   
//master insert line 22222
// master insert line 33333 
@end
