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

        let fiveFranc = Franc(amount: 5)
        XCTAssertEqual(fiveFranc.times(2), Franc(amount: 10))
        XCTAssertEqual(fiveFranc.times(3), Franc(amount: 15))
    }

    func testEquality() {
        XCTAssertTrue(Money.dollar(amount: 15) == Money.dollar(amount:15))
        XCTAssertFalse(Money.dollar(amount: 15) == Money.dollar(amount:18))

        XCTAssertTrue(Franc(amount: 15) == Franc(amount:15))
        XCTAssertFalse(Franc(amount: 15) == Franc(amount:18))

        XCTAssertFalse(Money.dollar(amount: 15) == Franc(amount:15))
    }

}
