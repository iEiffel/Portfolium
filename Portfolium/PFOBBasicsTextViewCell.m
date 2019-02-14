//
//  PFOBBasicsTextViewCell.m
//  Portfolium
//
//  Created by John Eisberg on 7/31/14.
//  Copyright (c) 2014 Portfolium. All rights reserved.
//

#import "PFOBBasicsTextViewCell.h"
#import "PFColor.h"
#import "PFConstraints.h"
#import "PFImage.h"
#import "GCPlaceholderTextView.h"
#import "PFFont.h"

@interface PFOBBasicsTextViewCell ()

@end

@implementation PFOBBasicsTextViewCell

+ (NSString *)preferredReuseIdentifier; {
    
    return @"PFOBBasicsTextViewCell";
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier; {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        GCPlaceholderTextView *textView = [[GCPlaceholderTextView alloc] initWithFrame:CGRectZero];
        [textView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [textView setPlaceholderColor:[PFColor placeholderTextColor]];
        [textView setTextColor:[PFColor textFieldTextColor]];
        [textView setReturnKeyType:UIReturnKeyDone];
        [textView setFont:[PFFont fontOfMediumSize]];
        [textView setBackgroundColor:[UIColor whiteColor]];
        [[self contentView] addSubview:textView];
        [self setTextView:textView];
        
        [[self contentView] addConstraints:@[[PFConstraints constrainView:[self textView]
                                                                 toHeightOfSuperView:[self contentView]
                                                              withPadding:5.0f],
                                             
                                             [PFConstraints constrainView:[self textView]
                                                                  toWidthOfSuperView:[self contentView]
                                                              withPadding:5.0f],
                                             
                                             [PFConstraints leftAlignView:[self textView]
                                                      relativeToSuperView:[self contentView]
                                                     withDistanceFromEdge:5.0f],
                                             
                                             [PFConstraints topAlignView:[self textView]
                                                     relativeToSuperView:[self contentView]
                                                    withDistanceFromEdge:5.0f],
                                             ]];
    }
    
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder
              animated:(BOOL)animated; {
    
    [[self textView] setPlaceholder:placeholder];
    
    if(animated) {
    
        CGRect frame = [self textView].frame;
        frame.origin.x = 520.0f;
        frame.origin.y = frame.origin.y + 48.0f;
        [self textView].frame = frame;
        
        [UIView animateWithDuration:0.4f
                              delay:0.4f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             
                             CGRect frame = [self textView].frame;
                             frame.origin.x = 10.0f;
                             [self textView].frame = frame;
                         }
                         completion:^(BOOL finished){
                         }];
    }
}

- (void)setPlaceholderText:(NSString *)text
                  animated:(BOOL)animated; {
    
    [[self textView] setPlaceholder:text];
    
    if(animated) {
        
        CGRect frame = [self textView].frame;
        frame.origin.x = -200.0f;
        frame.origin.y = frame.origin.y + 24.0f;
        [self textView].frame = frame;
        
        [UIView animateWithDuration:0.4f
                              delay:0.5f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             
                             CGRect frame = [self textView].frame;
                             frame.origin.x = 10.0f;
                             [self textView].frame = frame;
                         }
                         completion:^(BOOL finished){
                         }];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated; {
    
    [super setSelected:selected animated:animated];
}

@end
