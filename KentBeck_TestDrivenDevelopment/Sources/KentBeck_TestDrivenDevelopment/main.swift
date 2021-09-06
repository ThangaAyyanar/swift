import Foundation

public class Dollar {
    
    var amount: Int

    init(amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) {
        amount *= multiplier
    }
}
