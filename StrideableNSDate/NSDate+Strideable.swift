//
//  NSDateExtensions.swift
//  NSDateSwiftStudy
//
//  Created by adachi.yuichi on 2014/12/06.
//  Copyright (c) 2014年 yad. All rights reserved.
//

import Foundation

/**
Comparison operator for NSDate

:param: left NSDate
:param: right NSDate

:returns: left NSDate is earlier than right NSDate
*/
public func < (left : NSDate, right : NSDate) -> Bool {
    return left.compare(right) == NSComparisonResult.OrderedAscending
}

/**
Equal operator for NSDate

:param: left  NSDate
:param: right NSDate

:returns: left NSDate is equal to right NSDate
*/
public func == (left : NSDate, right : NSDate) -> Bool {
    return left.isEqualToDate(right)
}

/**
Extension of NSDate confirmation to Strideable protocol
*/
extension NSDate : Strideable {
    
    typealias Stride = NSTimeInterval
    
    /**
    Function that generates NSDate advanced by n seconds from self
    
    :param: n NSTimeInterval(s)
    
    :returns: adbanced NSDate
    */
    public func advancedBy(n: NSTimeInterval) -> Self {
        return self.dynamicType.init(timeInterval: n, sinceDate: self)
    }
    
    /**
    Function that generates NSInterval distance to other NSDate from self 
    
    :param: other NSDate
    
    :returns: NSTimeInterval distance
    */
    public func distanceTo(other: NSDate) -> NSTimeInterval {
        return other.timeIntervalSinceDate(self)
    }
}
