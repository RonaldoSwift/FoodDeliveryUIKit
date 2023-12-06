//
//  DateUtils.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 4/12/23.
//

import Foundation

/**
  Timestamps are declared using the Date type
 */
func getHourAndMinutes() -> String {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    return "\(hour) \(minutes)"
}


/// Produce a timestamp string for the given `dateFormat`.
///
/// ```
/// print(getTimestampStringWithFormat("yyyy-MM-dd HH:mm")) // "2000-07-11 20:04"
/// ```
///
/// > Warning: The returned greeting is not localized. To
/// > produce a localized string, use ``localizedHello(_:)``
/// > instead.
///
/// - Parameters:
///     - dateFormat: The date format to be printed.
///
/// - Returns: A timestamp for the given `dateFormat`.

func getTimestampStringWithFormat(with dateFormat: String = "dd/MM/yyyy") -> String {
    let today = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    return formatter.string(from: today)
}


/**
 This method sum two double numbers and returns.
 
 Here is the discussion. This methods adds two double and return the optional Double.
 

 - parameter number1: First Double Number.
 - parameter number2: Second Double Number.
 - returns: The sum of two double numbers.
 
 # Notes: #
 1. Parameters must be **double** type
 2. Handle return type because it is optional.
 
 # Example #
 ```
 if let sum = self.add(number1: 23, number2: 34) {
    print(sum)
 }
 ```
 */
func convertDateToTimeStamp() {
    let today = Date()
    let newTimestamp = today + TimeInterval(1) // next second
    let yesterday = today - TimeInterval(60*60*24) // previous day
}

func convertSecondsToTimestamp() {
    // getting the seconds since 1970 from a Swift timestamp
    let timestamp = Date().timeIntervalSince1970
    
    // converting seconds since 1970 into a Swift timestamp
    let secondsSince1970 = 1684165805.509
    let restoredDate = Date(timeIntervalSince1970: secondsSince1970)
    print(restoredDate)
}
