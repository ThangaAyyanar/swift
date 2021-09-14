import Foundation

public class Dollar {
    
    public var amount: Int

    init(amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) -> Dollar {
        return Dollar(amount: amount * multiplier)
    }

    static func ==(lhs: Dollar, rhs: Dollar) -> Bool {
        return lhs.amount == rhs.amount
    }
}
