import Foundation

protocol Expression {
    func reduce(to: String) -> Money
}

public class Money: Equatable, Expression {

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

    func plus(_ addend: Money) -> Expression {
        return Sum(augend: self, addend: addend)
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

    func reduce(to: String) -> Money {  
        return self
    }
}

public class Bank {

    func reduce(_ source: Expression, _ to: String) -> Money {
        source.reduce(to: "USD")
    }
}

public class Sum: Expression {
    let augend: Money
    let addend: Money

    init(augend: Money, addend: Money) {
        self.augend = augend
        self.addend = addend
    }

    func reduce(to: String) -> Money {
        let amount = augend.amount + addend.amount
        return Money(amount: amount, currency: to)
    }
}
