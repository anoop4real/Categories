## Categories

## Built with XCode 7.2
A set of categories

##Category for NSMutableAttributedString - To use as a readonly star rating control

Usage : 
```self.ratingLabel.attributedText = [NSMutableAttributedString starWithRating:rating outOfTotal:5 withFontSize:9.0f];```

##Added Swift extension

Usage :
```
  starLabel.attributedText = NSMutableAttributedString().starWithRating(3.5, outOfTotal: 5, withFontSize: 8.0)
  starLabelFull.attributedText = NSMutableAttributedString().starWithRating(5, outOfTotal: 5, withFontSize: 8.0)
  starLabelZero.attributedText = NSMutableAttributedString().starWithRating(0, outOfTotal: 5, withFontSize: 8.0)
``` 
##Applicationlogger: To log data to file for debugging purposes

Usage:
```
Applicationlogger.Applog("I am starting")
```



