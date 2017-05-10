//
//  AnnouncementView.m
//  POS
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import "AnnouncementView.h"
#import "AnnounceAdapter.h"

@implementation AnnouncementView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)show
{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 1.f;
        //self.frame = CGRectMake(0, 81, 1024, 768 - 80);
    } completion:^(BOOL finished){
        
    }];
}

- (void)hide
{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0.f;
        //self.frame = CGRectMake(1024, 81, 1024, 768 - 80);
    } completion:^(BOOL finished){
        
    }];
}


@end
