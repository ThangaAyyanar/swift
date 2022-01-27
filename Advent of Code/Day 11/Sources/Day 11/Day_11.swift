struct Position{
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

public class Day_11 {
    var inputs: [[Int]]

    public init(inputs: [[Int]]) {
        self.inputs = inputs
    }

    func isValidIndex(_ row: Int, _ col: Int) -> Bool {
        if row < 0 || row >= inputs.count {
            return false
        }
        if col < 0 || col >= inputs[0].count {
            return false
        }
        return true
    }
    
    func printInput() {
        
        for input in inputs{
            print(input)
        }
    }


    func addOne() {
        for (row, input) in inputs.enumerated() {
            for (col, _) in input.enumerated() {
                inputs[row][col] += 1
            }
        }
    }

    func processFlash() -> Int {
        var flashes = 0
        for (row, input) in inputs.enumerated() {
            for (col, _) in input.enumerated() {
                if inputs[row][col] > 9 {
                    inputs[row][col] = 0
                    flashes += 1
                    let offset = [Position(row+1, col), Position(row-1, col),
                                  Position(row, col+1), Position(row, col-1),
                                  Position(row+1, col-1), Position(row-1, col+1),
                                  Position(row-1, col-1), Position(row+1, col+1)]
                    for position in offset {
                        let offX = position.x
                        let offY = position.y
                        if isValidIndex(offX, offY) {
                            if inputs[offX][offY] != 0 {
                                inputs[offX][offY] += 1
                            }
                        }
                    }
                }
            }
        }
        return flashes
    }

    func part1() -> Int {
        var totalFlashes = 0

        for _ in 0..<100 {
            addOne()
            var flashes = processFlash()
            while flashes > 0 {
                totalFlashes += flashes
                flashes = processFlash()
            }
        }
        return totalFlashes
    }

    func allZero() -> Bool{
        var count = 0
        for (row, input) in inputs.enumerated() {
            for (col, _) in input.enumerated() {
                if inputs[row][col] == 0 {
                    count += 1
                }
            }
        }
        return count == (inputs.count * inputs[0].count)
    }

    func part2() -> Int {
        var index = 0
        while true{
            addOne()
            var flashes = processFlash()
            while flashes > 0 {
                flashes = processFlash()
                if allZero() {
                    return index + 1
                }
            }
            index += 1
        }
    }
}
