
public struct Position {
    var x,y: Int
}

public struct Day_9 {

    var inputs: [[Int]]

    public init(inputs: [[Int]]) {
        self.inputs = inputs
    }

    func part1() -> Bool {

        var smallest = [Position: Int]()

        for (row, input) in inputs.enumerated() {
            var currentSmall = -1
            var position = Position(x: -1, y: -1)
            for (col, value) in input.enumerated() {
                
                let leftValue = row - 1
                let rightValue = row + 1
                let topValue = col + 1
                let bottomValue = col - 1

                if leftVaue >= 0 && input[leftValue] < value {
                    currentSmall = input[leftValue]
                }
            }
        }

        return true
    }
}
