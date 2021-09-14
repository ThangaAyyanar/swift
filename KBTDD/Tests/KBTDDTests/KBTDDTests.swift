import XCTest
@testable import KBTDD

final class KBTDDTests: XCTestCase {

    func testMultiplication() {

        let fiveDollar = Dollar(amount: 5)
        var product = fiveDollar.times(2)
        XCTAssertEqual(product.amount, 10)
        product = fiveDollar.times(3)
        XCTAssertEqual(product.amount, 15)
    }

    func testEquality() {
        XCTAssertTrue(Dollar(amount: 15) == Dollar(amount:15))
        XCTAssertFalse(Dollar(amount: 15) == Dollar(amount:18))
    }

}
