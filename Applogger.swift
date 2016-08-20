//
//  Applogger.swift
//  MyCatalogue
//
//  Created by anoopm on 20/08/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import Foundation

class Applogger {
    
    class func Applog (message:String){
        
        let messageToLog:String = message
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let logPath = (documentsPath as NSString).stringByAppendingPathComponent("application.log")
        print(logPath)
        // Check if file already exists at the log path
        let isFileAvaialble = NSFileManager.defaultManager().fileExistsAtPath(logPath)
        
        if(isFileAvaialble){
            var fileSize:UInt64 = 0
            do {
                let attr : NSDictionary? = try NSFileManager.defaultManager().attributesOfItemAtPath(logPath)
                
                if let _attr = attr {
                    fileSize = _attr.fileSize();
                }
            } catch {
                print("Error: \(error)")
            }
            
            fileSize = fileSize/1024
            
            if(fileSize > 3000){
                
                let backupLogPath = (documentsPath as NSString).stringByAppendingPathComponent("application.log.bak")
                // Check if file already exists at the log path
                let isFileAvaialble = NSFileManager.defaultManager().fileExistsAtPath(backupLogPath)
                // If backup already exists then remove and move the current log as back up
                if(isFileAvaialble){
                    
                    do{
                        try NSFileManager.defaultManager().removeItemAtPath(backupLogPath)
                        
                        do{
                            try NSFileManager.defaultManager().moveItemAtPath(logPath, toPath: backupLogPath)
                        }catch let error as NSError{
                            print("Error: \(error)")
                        }
                    }catch let error as NSError{
                        
                        print("Error: \(error)")
                    }

                }
            }
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let time = dateFormatter.stringFromDate(NSDate())
        
        let messageToWrite = "[\(time)]:\(messageToLog)"
        
        let fileHandle:NSFileHandle? = NSFileHandle.init(forWritingAtPath: logPath)
        
        if let handler = fileHandle{
            
            handler.seekToEndOfFile()
            let space = "\n"
            handler.writeData(space.dataUsingEncoding(NSUTF8StringEncoding)!)
            handler.writeData(messageToWrite.dataUsingEncoding(NSUTF8StringEncoding)!)
            handler.closeFile()

        }else{
            
            do{
                try messageToWrite.writeToFile(logPath, atomically: false, encoding: NSUTF8StringEncoding)
            }catch let error as NSError{
                
                print("Error: \(error)")
            }
        }
        

        
    }
}