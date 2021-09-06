import Foundation

public class Dollar {
    
    public var amount: Int

    init(amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) {
        amount *= multiplier
    }
}
