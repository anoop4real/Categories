//
//  Extensions.swift
//  MyCatalogue
//
//  Created by anoopm on 14/08/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString{

    func starWithRating(rating:Float, outOfTotal totalNumberOfStars:NSInteger, withFontSize size:CGFloat) ->NSAttributedString{
        
        
        let currentFont = UIFont(name: "<USE UR FONT HERE>", size: size)!
        
        let activeStarFormat = [ NSFontAttributeName:currentFont, NSForegroundColorAttributeName: UIColor.redColor()];
        
        let inactiveStarFormat = [ NSFontAttributeName:currentFont, NSForegroundColorAttributeName: UIColor.lightGrayColor()];
        
        let starString = NSMutableAttributedString()
        
        for(var i = 0; i < totalNumberOfStars; ++i){
            
            if(rating >= Float(i+1)){
                // This is for selected star. Change the unicode value according to the font that you use
                starString.appendAttributedString(NSAttributedString(string: "\u{22C6} ", attributes: activeStarFormat))
            }
            else if (rating > Float(i)){
                // This is for selected star. Change the unicode value according to the font that you use
                starString.appendAttributedString(NSAttributedString(string: "\u{E1A1} ", attributes: activeStarFormat))
            }
            else{
                // This is for de-selected star. Change the unicode value according to the font that you use
                starString.appendAttributedString(NSAttributedString(string: "\u{22C6} ", attributes: inactiveStarFormat))
            }
        }
        
        return starString
    }
}