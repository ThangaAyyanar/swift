## Unwarping the value from tuple

```
enum Trade {
    case Buy(stock: String, amount: Int) //This is tuple
    case Sell(stock: String, amount: Int)
}
func trade(type: Trade) {}


let trad = Trade.Buy(stock: "Hello", amount: 90)
let sample = trade(type: trad)


if case let Trade.Buy(stock,amount) = trad { //we can unwarp tuple by this way
    print("The Value is \(stock) and \(amount)")


```
