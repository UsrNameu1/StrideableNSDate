//
//  NSDateSwiftStudyTests.swift
//  NSDateSwiftStudyTests
//
//  Created by adachi.yuichi on 2014/12/06.
//  Copyright (c) 2014年 yad. All rights reserved.
//

import UIKit
import XCTest
import StrideableNSDate

class NSDateExtensionsTests: XCTestCase {
    
    var formatter: NSDateFormatter!
    
    override func setUp() {
        super.setUp()
        
        formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = NSTimeZone(abbreviation: "GMT")
    }
    
    func testCompare() {
        
        let dateFor20010101 = formatter.dateFromString("2001-01-01 00:00:00")!
        let dateFor20010102 = formatter.dateFromString("2001-01-02 00:00:00")!
        
        XCTAssert(dateFor20010101 < dateFor20010102, "past should be smaller than future")
        XCTAssert(dateFor20010102 > dateFor20010101, "future should be larger than past")
    }
    
    func testEqual() {
        
        let dateFor20010101 = formatter.dateFromString("2001-01-01 00:00:00")!
        let dateFor20010102 = formatter.dateFromString("2001-01-01 00:00:00")!
        
        XCTAssert(dateFor20010101 == dateFor20010102, "same date shold be equal")
    }
    
    func testStrideThroughFunction() {
        
        let dateFor20010101000000 = formatter.dateFromString("2001-01-01 00:00:00")!
        let dateFor20010101100000 = formatter.dateFromString("2001-01-01 10:00:00")!
        
        let strideThrough = stride(from: dateFor20010101000000, through: dateFor20010101100000, by: 60 * 60)
    
        map(enumerate(strideThrough)) { index, date in XCTAssert(date == self.formatter.dateFromString("2001-01-01 \(index):00:00")!, "strideThrough should be properly generated") }
        XCTAssert(maxElement(strideThrough) == dateFor20010101100000, "strideThrough should contain end")
    }
    
    func testStrideToFunction() {
        
        let dateFor20010101000000 = formatter.dateFromString("2001-01-01 00:00:00")!
        let dateFor20010101100000 = formatter.dateFromString("2001-01-01 10:00:00")!
        
        let strideTo = stride(from: dateFor20010101000000, to: dateFor20010101100000, by: 60 * 60)
        
        map(enumerate(strideTo)) { index, date in XCTAssert(date == self.formatter.dateFromString("2001-01-01 \(index):00:00")!, "strideTo should be properly generated") }
        XCTAssert(maxElement(strideTo) != dateFor20010101100000, "strideTo should not contain end")
    }
    
    func testPlusOperator() {
        
        let dateFor20010101000000 = formatter.dateFromString("2001-01-01 00:00:00")!
        let dateFor20010101040000 = formatter.dateFromString("2001-01-01 04:00:00")!
        
        XCTAssert(dateFor20010101000000 + 60 * 60 * 4 == dateFor20010101040000, "plus operator should generate Date")
        XCTAssert(60 * 60 * 4 + dateFor20010101000000 == dateFor20010101040000, "plus operator should generate Date")
    }
    
    func testPlusAssignOperator() {
        
        var dateFor20010101000000 = formatter.dateFromString("2001-01-01 00:00:00")!
        let dateFor20010101040000 = formatter.dateFromString("2001-01-01 04:00:00")!
        dateFor20010101000000 += NSTimeInterval(60 * 60 * 4)
        
        XCTAssert(dateFor20010101000000 == dateFor20010101040000, "plus assign operator should alter Date")
    }
    
    func testMinusOperator() {
        
        let dateFor20010101000000 = formatter.dateFromString("2001-01-01 00:00:00")!
        let dateFor20010101040000 = formatter.dateFromString("2001-01-01 04:00:00")!
        
        XCTAssert(dateFor20010101040000 - 60 * 60 * 4 == dateFor20010101000000, "minus operator should generate Date")
        XCTAssert(dateFor20010101040000 - dateFor20010101000000 == NSTimeInterval(60 * 60 * 4), "minus operator should generate Stride")
    }
    
    func testMinusAssignOperator() {
        
        let dateFor20010101000000 = formatter.dateFromString("2001-01-01 00:00:00")!
        var dateFor20010101040000 = formatter.dateFromString("2001-01-01 04:00:00")!
        dateFor20010101040000 -= NSTimeInterval(60 * 60 * 4)
        
        XCTAssert(dateFor20010101000000 == dateFor20010101040000, "minus assign operator should alter Date")
    }
    
}
