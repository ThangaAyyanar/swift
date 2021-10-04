import Foundation

public class Money: Equatable {

    var amount: Int
    var currency: String

    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }

    static public func ==(lhs: Money, rhs: Money) -> Bool {
        // print("Log: lhs \(type(of: lhs)) rhs \(type(of: rhs)) ")
        return lhs.amount == rhs.amount && lhs.currency == rhs.currency
    }

    func times(_ multiplier: Int) -> Money {
        return Money(amount: amount * multiplier, currency: currency)
    }

    public func getCurrency() -> String {
        return currency
    }

    //MARK: - Factory Methods

    static public func dollar(amount: Int) -> Money {
        return Money(amount: amount, currency: "USD")
    }

    static public func franc(amount: Int) -> Money {
        return Money(amount: amount, currency: "CHF")
    }
}
