import Foundation

public class Dollar {
    
    public var amount: Int

    init(amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) {
        amount *= multiplier
    }

    func doubleTimes(_ multiplier: Int) {
        amount *= multiplier
        amount *= multiplier
    }
}
