import XCTest
@testable import KBTDD

final class KBTDDTests: XCTestCase {

    func testMultiplication() {

        let fiveDollar = Dollar(amount: 5)
        fiveDollar.times(2)
        XCTAssertEqual(fiveDollar.amount, 10)
    }
}
