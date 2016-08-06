//
//  NSMutableAttributedString+Stars.h
//  Created by anoopm on 30/07/16.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (Stars)
+ (NSAttributedString *)starWithRating:(CGFloat)rating
                            outOfTotal:(NSInteger)totalNumberOfStars
                          withFontSize:(CGFloat) fontSize;
@end
