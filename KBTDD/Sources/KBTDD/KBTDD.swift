import Foundation

protocol Expression {
    func reduce(bank: Bank, to: String) -> Money
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

    func reduce(bank: Bank, to: String) -> Money {  
        let rate = bank.rate(currency, to)
        return Money(amount: amount/rate, currency: to)
    }
}

public class Bank {

    private var rates: [Pair: Int] = [Pair: Int]()

    func reduce(_ source: Expression, _ to: String) -> Money {
        source.reduce(bank: self, to: "USD")
    }

    func addRate(from: String, to: String, rate: Int) {
        let pair = Pair(from: from, to: to)
        rates[pair] = rate
    }

    func rate(_ currency: String, _ to: String) -> Int {
        if currency == to {
            return 1
        }
        let pair = Pair(from: currency, to: to)
        return rates[pair]! // Force Unwrap
    }
}

public class Sum: Expression {
    let augend: Money
    let addend: Money

    init(augend: Money, addend: Money) {
        self.augend = augend
        self.addend = addend
    }

    func reduce(bank: Bank, to: String) -> Money {  
        let amount = augend.amount + addend.amount
        return Money(amount: amount, currency: to)
    }
}

class Pair: Hashable {
    private let from: String
    private let to: String

    init(from: String, to: String) {
        self.from = from
        self.to = to
    }

    static public func ==(lhs: Pair, rhs: Pair) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(from)
        hasher.combine(to)
    }
}
