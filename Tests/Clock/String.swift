import XCTest
@testable import Clock
import Foundation

#if !os(Linux)
extension NSDateComponents {
    func toDate() -> NSDate {
        let calendar = Calendar(identifier: .gregorian)
        return calendar?.date(from: self as DateComponents) ?? NSDate()
    }
}
#endif

class DateToStringConversionTests: XCTestCase {
    func testConvertTMStructToAnISO8601GMTString() {
        let actual = tm_struct(year: 1971, month: 2, day: 3, hour: 9, minute: 16, second: 6)

        XCTAssertEqual(actual.toISO8601GMTString(), "1971-02-03T09:16:06Z")
    }

#if !os(Linux)
    func testCanConvertNSDateToAnISO8601GMString() {
        let input = components(year: 1971, month: 2, day: 3, hour: 9, minute: 16, second: 6)
        let actual = input.toDate()

        XCTAssertEqual(actual.toISO8601GMTString(), "1971-02-03T09:16:06Z")
    }
#endif
}

#if os(Linux)
extension DateToStringConversionTests {
    static var allTests : [(String, DateToStringConversionTests -> () throws -> Void)] {
        return [
            ("testConvertTMStructToAnISO8601GMTString", testConvertTMStructToAnISO8601GMTString)
        ]
    }
}
#endif
