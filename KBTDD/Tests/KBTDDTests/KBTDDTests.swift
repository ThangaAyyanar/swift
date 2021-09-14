import XCTest
@testable import KBTDD

final class KBTDDTests: XCTestCase {

    func testMultiplication() {

        let fiveDollar = Dollar(amount: 5)
        XCTAssertEqual(fiveDollar.times(2), Dollar(amount: 10))
        XCTAssertEqual(fiveDollar.times(3), Dollar(amount: 15))
    }

    func testEquality() {
        XCTAssertTrue(Dollar(amount: 15) == Dollar(amount:15))
        XCTAssertFalse(Dollar(amount: 15) == Dollar(amount:18))
    }

}
