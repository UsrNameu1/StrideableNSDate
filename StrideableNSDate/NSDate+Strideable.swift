//
//  NSDateExtensions.swift
//  NSDateSwiftStudy
//
//  Created by adachi.yuichi on 2014/12/06.
//  Copyright (c) 2014年 yad. All rights reserved.
//

import Foundation

/**
NSDate を比較する為の演算子です。

:param: left  左辺 NSDate
:param: right 右辺 NSDate

:returns: 右辺より左辺が過去であるかどうか
*/
public func < (left : NSDate, right : NSDate) -> Bool {
    return left.compare(right) == NSComparisonResult.OrderedAscending
}

/**
NSDate の等値性を確認する為の演算子です。

:param: left  左辺 NSDate
:param: right 右辺 NSDate

:returns: 右辺と左辺が同一時刻であるかどうか
*/
public func == (left : NSDate, right : NSDate) -> Bool {
    return left.isEqualToDate(right)
}

/**
NSDate を Strideable プロトコルに準拠させる為の実装です。
*/
extension NSDate : Strideable {
    
    typealias Stride = NSTimeInterval
    
    /**
    指定の NSTimeInterval 秒進んだ NSDate を返します。
    
    :param: n 何秒進むか
    
    :returns: 指定秒進んだ NSDate
    */
    public func advancedBy(n: NSTimeInterval) -> Self {
        return self.dynamicType.init(timeInterval: n, sinceDate: self)
    }
    
    /**
    指定の NSDate がどのくらいの秒数離れているかを NSTimeInterval で返します。
    
    :param: other 指定の NSDate
    
    :returns: 何秒離れているかを示す NSTimeInterval
    */
    public func distanceTo(other: NSDate) -> NSTimeInterval {
        return other.timeIntervalSinceDate(self)
    }
}
