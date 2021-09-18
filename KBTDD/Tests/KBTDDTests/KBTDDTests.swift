import XCTest
@testable import KBTDD

final class KBTDDTests: XCTestCase {

    func testMultiplication() {

        let fiveDollar = Dollar(amount: 5)
        XCTAssertEqual(fiveDollar.times(2), Dollar(amount: 10))
        XCTAssertEqual(fiveDollar.times(3), Dollar(amount: 15))
    }

    func testFrancMultiplication() {

        let fiveFranc = Franc(amount: 5)
        XCTAssertEqual(fiveFranc.times(2), Franc(amount: 10))
        XCTAssertEqual(fiveFranc.times(3), Franc(amount: 15))
    }

    func testEquality() {
        XCTAssertTrue(Dollar(amount: 15) == Dollar(amount:15))
        XCTAssertFalse(Dollar(amount: 15) == Dollar(amount:18))

        XCTAssertTrue(Franc(amount: 15) == Franc(amount:15))
        XCTAssertFalse(Franc(amount: 15) == Franc(amount:18))

        XCTAssertFalse(Dollar(amount: 15) == Franc(amount:15))
    }

}
