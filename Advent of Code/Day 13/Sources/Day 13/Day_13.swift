public struct Position{
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

public enum Folding {
    case x(Int)
    case y(Int)
}


public struct Day_13 {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}
