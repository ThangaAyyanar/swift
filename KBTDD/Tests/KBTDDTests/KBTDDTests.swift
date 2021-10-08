import XCTest
@testable import KBTDD

final class KBTDDTests: XCTestCase {

    func testMultiplication() {

        let fiveDollar = Money.dollar(amount: 5)
        XCTAssertEqual(fiveDollar.times(2) as! Money, Money.dollar(amount: 10))
        XCTAssertEqual(fiveDollar.times(3) as! Money, Money.dollar(amount: 15))
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

    func testReduceSum() {

        let sum = Sum(augend: Money.dollar(amount: 3), 
                      addend: Money.dollar(amount: 4))
        let bank = Bank()
        let result = bank.reduce(sum, "USD")
        XCTAssertEqual(Money.dollar(amount: 7), result)
    }

    func testReduceMoney() {

        let bank = Bank()
        let result = bank.reduce(Money.dollar(amount: 1), "USD")
        XCTAssertEqual(Money.dollar(amount: 1), result)
    }

    func testMoneyDifferentCurrency() {

        let bank = Bank()
        bank.addRate(from: "CHF",to: "USD", rate: 2)
        let result = bank.reduce(Money.franc(amount: 2), "USD")
        XCTAssertEqual(Money.dollar(amount: 1), result)
    }

    func testIdentityRate() {
        XCTAssertEqual(1, Bank().rate("USD", "USD"))
    }

    func testMixedAddition() {
        let fiveBucks = Money.dollar(amount: 5)
        let tenFrancs = Money.franc(amount: 10)
        let bank = Bank()
        bank.addRate(from: "CHF", to: "USD", rate: 2)
        let result = bank.reduce(fiveBucks.plus(tenFrancs), "USD")
        XCTAssertEqual(Money.dollar(amount: 10), result)
    }
}
