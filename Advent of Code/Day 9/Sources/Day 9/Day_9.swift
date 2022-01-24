
public struct Position {
    var x,y: Int
}

public struct Day_9 {

    var inputs: [[Int]]

    public init(inputs: [[Int]]) {
        self.inputs = inputs
    }

    func get_data(x: Int, y: Int) -> Int {

        if x < 0 || x >= inputs.count {
            return 10
        }
        if y < 0 || y >= inputs[0].count {
            return 10
        }
        return inputs[x][y]
    }

    func part1() -> Int {

        var smallest = [Int]()

        for (row, input) in inputs.enumerated() {
            for (col, value) in input.enumerated() {

                let offsets = [(row - 1, col),(row + 1, col),(row,col + 1),(row,col - 1)]

                var count = 0
                for (xoff, yoff) in offsets {
                    if value < get_data(x: xoff, y: yoff) {
                        count += 1
                    }
                }

                if count == 4 {
                    smallest.append(value + 1)
                }
                
            }
        }
        return smallest.reduce(0) { $0 + $1}
    }
}
