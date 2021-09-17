import Foundation

public class Dollar: Equatable {
    
    var amount: Int

    init(amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) -> Dollar {
        return Dollar(amount: amount * multiplier)
    }

    static public func ==(lhs: Dollar, rhs: Dollar) -> Bool {
        return lhs.amount == rhs.amount
    }
}

public class Franc: Equatable {
    
    var amount: Int

    init(amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) -> Franc {
        return Franc(amount: amount * multiplier)
    }

    static public func ==(lhs: Franc, rhs: Franc) -> Bool {
        return lhs.amount == rhs.amount
    }
}
