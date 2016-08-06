//
//  NSMutableAttributedString+Stars.m
//
//  Created by anoopm on 30/07/16..
//

#import "NSMutableAttributedString+Stars.h"

@implementation NSMutableAttributedString (Stars)

+ (NSAttributedString *)starWithRating:(CGFloat)rating
                            outOfTotal:(NSInteger)totalNumberOfStars
                          withFontSize:(CGFloat) fontSize{
    UIFont *currentFont = [UIFont fontWithName:@"SS Pika" size:fontSize];
    NSDictionary *activeStarFormat = @{
                                           NSFontAttributeName : currentFont,
                                           NSForegroundColorAttributeName : [UIColor redColor]
                                           };
    NSDictionary *inactiveStarFormat = @{
                                             NSFontAttributeName : currentFont,
                                             NSForegroundColorAttributeName : [UIColor lightGrayColor]
                                             };
    
    NSMutableAttributedString *starString = [NSMutableAttributedString new];
    
    for (int i=0; i < totalNumberOfStars; ++i) {
        //Full star
        if (rating >= i+1) {
            [starString appendAttributedString:[[NSAttributedString alloc]
                                               initWithString:@"\u22C6 " attributes:activeStarFormat]];
        }
        //Half star
        else if (rating > i) {
            [starString appendAttributedString:[[NSAttributedString alloc]
                                               initWithString:@"\uE1A1 " attributes:activeStarFormat]];
        }
        // Grey star
        else {
            [starString appendAttributedString:[[NSAttributedString alloc]
                                               initWithString:@"\u22C6 " attributes:inactiveStarFormat]];
        }

    }
    return starString;
}
@end
