StrideableNSDate

[![Build Status](https://travis-ci.org/UsrNameu1/StrideableNSDate.svg?branch=master)](https://travis-ci.org/UsrNameu1/StrideableNSDate)

NSDate+Strideable

##Compareable & Equatable

```Swift
let formatter = NSDateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
formatter.timeZone = NSTimeZone(abbreviation: "GMT")

let dateFor20010101 = formatter.dateFromString("2001-01-01 00:00:00")!
let dateFor20010102 = formatter.dateFromString("2001-01-02 00:00:00")!

// true : past is smaller than future
dateFor20010101 < dateFor20010102 

// true : future is larger than past
dateFor20010102 > dateFor20010101 

// false : other date should be not equal
dateFor20010101 == dateFor20010102 
```

##Strideable

```Swift
let formatter = NSDateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
formatter.timeZone = NSTimeZone(abbreviation: "GMT")

let dateFor20010101000000 = formatter.dateFromString("2001-01-01 00:00:00")!
let dateFor20010101100000 = formatter.dateFromString("2001-01-01 10:00:00")!

// generates NSDate sequence through end
let strideThrough = stride(from: dateFor20010101000000, through: dateFor20010101100000, by: 60 * 60)

// generates NSDate sequence to end
let strideTo = stride(from: dateFor20010101000000, to: dateFor20010101100000, by: 60 * 60)

// true : plus operator generates Date advanced by right NSTimeInterval
dateFor20010101000000 + 60 * 60 * 10 == dateFor20010101100000 

// true : plus operator generates Date advanced by left NSTimeInterval
60 * 60 * 10 + dateFor20010101000000 == dateFor20010101100000 

// true : minus operator generates Date decreased by right NSTimeInterval
dateFor20010101100000 - 60 * 60 * 10 == dateFor20010101000000

// true : minus operator for two NSDate generates NSTimeInterval distance
dateFor20010101100000 - dateFor20010101000000 == NSTimeInterval(60 * 60 * 10)
```
