//
//  AksCommonExtensions + Date.swift
//  aryansbtloe
//
//  Created by Alok on 05/12/18.
//  Copyright (c) 2019 Oravel Stays Private Limited
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

public extension Date {

    /// Returns current milliseconds after time
    ///
    /// - Parameter timeInterval: time interval
    /// - Returns: milliseconds after time interval
    func milliSecondAfterTime(_ timeInterval: TimeInterval) -> Int {
        return (Int((self.timeIntervalSince1970 - timeInterval)*1000))
    }

    /// Return self as NSDate
    ///
    /// - Returns: NSDate value
    func toNSDate() -> NSDate {
        return self as NSDate
    }

    func isEqualToDateIgnoringTime(date: Date) -> Bool {
        let calendar = NSCalendar.current
        let components1 = calendar.dateComponents([.day, .month, .year], from: self)
        let components2 = calendar.dateComponents([.day, .month, .year], from: date)
        return (components1.day == components2.day && components1.month == components2.month && components1.year == components2.year)
    }

    func isLessThanDate(date: Date) -> Bool {
        let calendar = NSCalendar.current
        let components1 = calendar.dateComponents([.day, .month, .year], from: self)
        let components2 = calendar.dateComponents([.day, .month, .year], from: date)
        guard let date1 = calendar.date(from: components1), let date2 = calendar.date(from: components2) else {
            return false
        }
        return (date1.compare(date2) == .orderedAscending)
    }

}
