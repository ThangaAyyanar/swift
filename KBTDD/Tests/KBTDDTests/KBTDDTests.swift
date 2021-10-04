import XCTest
@testable import KBTDD

final class KBTDDTests: XCTestCase {

    func testMultiplication() {

        let fiveDollar = Money.dollar(amount: 5)
        XCTAssertEqual(fiveDollar.times(2), Money.dollar(amount: 10))
        print("Log: \(fiveDollar.times(2).amount) \(Money.dollar(amount: 10).amount)")
        XCTAssertEqual(fiveDollar.times(3), Money.dollar(amount: 15))
    }

    func testFrancMultiplication() {

        let fiveFranc = Money.franc(amount: 5)
        XCTAssertEqual(fiveFranc.times(2), Money.franc(amount: 10))
        XCTAssertEqual(fiveFranc.times(3), Money.franc(amount: 15))
    }

    func testEquality() {
        XCTAssertTrue(Money.dollar(amount: 15) == Money.dollar(amount:15))
        XCTAssertFalse(Money.dollar(amount: 15) == Money.dollar(amount:18))

        XCTAssertTrue(Money.franc(amount: 15) == Money.franc(amount:15))
        XCTAssertFalse(Money.franc(amount: 15) == Money.franc(amount:18))

        XCTAssertFalse(Money.dollar(amount: 15) == Money.franc(amount:15))
    }

    func testCurrency() {
        XCTAssertEqual("USD", Money.dollar(amount: 1).getCurrency());
        XCTAssertEqual("CHF", Money.franc(amount: 1).getCurrency());
    }
}
