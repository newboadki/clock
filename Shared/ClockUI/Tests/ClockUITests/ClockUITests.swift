import XCTest
@testable import ClockUI

final class ClockUITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ClockUI().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
