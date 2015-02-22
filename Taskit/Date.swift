//
//  Date.swift
//  Taskit
//
//  Created by JIAN WANG on 2/21/15.
//  Copyright (c) 2015 JACY WANG. All rights reserved.
//

import Foundation

class Date {
    class func from(#year: Int, month: Int, day: Int) -> NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalender = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalender?.dateFromComponents(components)
        
        return date!
    }
    
    class func toString(#date: NSDate) -> String {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        var dateString = dateStringFormatter.stringFromDate(date)
        return dateString
    }
}