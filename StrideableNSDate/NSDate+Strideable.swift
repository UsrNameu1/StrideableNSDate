//
//  NSDateExtensions.swift
//  NSDateSwiftStudy
//
//  Created by adachi.yuichi on 2014/12/06.
//  Copyright (c) 2014年 yad. All rights reserved.
//
//  The MIT License (MIT)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

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
