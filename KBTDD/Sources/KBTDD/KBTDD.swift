import Foundation

public class Money: Equatable {

    var amount: Int

    init() {
        amount = 0
    }

    static public func ==(lhs: Money, rhs: Money) -> Bool {
        // print("Log: lhs \(type(of: lhs)) rhs \(type(of: rhs)) ")
        return lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }
}

public class Dollar: Money{
    
    init(amount: Int) {
        super.init()
        self.amount = amount
    }

    func times(_ multiplier: Int) -> Dollar {
        return Dollar(amount: amount * multiplier)
    }

}

public class Franc: Money{
    
    init(amount: Int) {
        super.init()
        self.amount = amount
    }

    func times(_ multiplier: Int) -> Franc {
        return Franc(amount: amount * multiplier)
    }

}
