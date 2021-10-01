import Foundation

public class Money: Equatable {

    var amount: Int
    public var currency: String!

    init() {
        amount = 0
    }

    static public func ==(lhs: Money, rhs: Money) -> Bool {
        // print("Log: lhs \(type(of: lhs)) rhs \(type(of: rhs)) ")
        return lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }

    //This has to be abstract method
    func times(_ multiplier: Int) -> Money {
        print("Log: I am called")
        return Money()
        /*let money = Money()*/
        /*money.amount *= multiplier*/
        /*return money*/
    }

    //MARK: - Factory Methods

    static public func dollar(amount: Int) -> Money {
        return Dollar(amount: amount, currency: "USD")
    }

    static public func franc(amount: Int) -> Money {
        return Franc(amount: amount, currency: "CHF")
    }
}

public class Dollar: Money{

    init(amount: Int, currency: String) {
        super.init()
        self.amount = amount
        self.currency = currency
    }

    override func times(_ multiplier: Int) -> Money {
        return Money.dollar(amount: amount * multiplier)
    }

}

public class Franc: Money{

    init(amount: Int, currency: String) {
        super.init()
        self.amount = amount
        self.currency = currency
    }

    override func times(_ multiplier: Int) -> Money {
        return Money.franc(amount: amount * multiplier)
    }

}
