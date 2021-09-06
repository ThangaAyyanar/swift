import XCTest
@testable import KBTDD

final class KBTDDTests: XCTestCase {

    func testMultiplication() {

        let fiveDollar = Dollar(amount: 5)
        fiveDollar.times(2)
        XCTAssertEqual(fiveDollar.amount, 10)
    }

    // Just a test
    func testMultiplicationDouble() {

        let fiveDollar = Dollar(amount: 5)
        fiveDollar.doubleTimes(2)
        XCTAssertEqual(fiveDollar.amount, 20)
    }
}
