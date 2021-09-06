import XCTest

/*import KentBeck_TestDrivenDevelopment*/

final class DollarTest: XCTestCase {

    func testMultiplication() {
        let fiveDollar = Dollar(amount: 5)
        fiveDollar.times(2)
        XCTAssert(fiveDollar.amount == 10)
    }
}
