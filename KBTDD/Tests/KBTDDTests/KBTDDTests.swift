import XCTest
@testable import KBTDD

final class KBTDDTests: XCTestCase {

    func testMultiplication() {

        let fiveDollar = Money.dollar(amount: 5)
        XCTAssertEqual(fiveDollar.times(2), Money.dollar(amount: 10))
        XCTAssertEqual(fiveDollar.times(3), Money.dollar(amount: 15))
    }

    func testEquality() {
        XCTAssertTrue(Money.dollar(amount: 15) == Money.dollar(amount:15))
        XCTAssertFalse(Money.dollar(amount: 15) == Money.dollar(amount:18))
        XCTAssertFalse(Money.dollar(amount: 15) == Money.franc(amount:15))
    }

    func testCurrency() {
        XCTAssertEqual("USD", Money.dollar(amount: 1).getCurrency());
        XCTAssertEqual("CHF", Money.franc(amount: 1).getCurrency());
    }

    func testSimpleAddition() {

        let five = Money.dollar(amount: 5)
        let expression = five.plus(five)
        let bank = Bank()
        let reduced = bank.reduce(expression, "USD")
        XCTAssertEqual(Money.dollar(amount: 10), reduced)
    }
}
