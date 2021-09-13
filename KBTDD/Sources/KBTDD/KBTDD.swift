import Foundation

public class Dollar {
    
    public var amount: Int

    init(amount: Int) {
        self.amount = amount
    }

    func times(_ multiplier: Int) -> Dollar {
        return Dollar(amount: amount * multiplier)
    }

    func equals(_ dollar: Dollar) -> Bool{
        return self.amount == dollar.amount
    }
}
