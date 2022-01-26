public class Day_11 {
    var inputs: [[Int]]

    public init(inputs: [[Int]]) {
        self.inputs = inputs
    }

    func isValidIndex(_ row: Int, _ col: Int) -> Bool {
        if row >= 0 && row < inputs.count {
            return true
        }
        else if col >= 0 && col < inputs[0].count {
            return true
        }
        return false
    }

    func part1() -> Int {
        print(inputs)
        for (row, input) in inputs.enumerated() {
            for (col, value) in input.enumerated() {

                inputs[row][col] += 1

                if inputs[row][col] > 9 {

                    print("input \(row) \(col) reached threshold")
                    inputs[row][col] = 0

                    var queue = [(row, col)]

                    while queue.count > 0 {
                        let result = queue.dropFirst()
                        let row = result[0]
                        let col = result[1]
                        let offset = [(row+1, col), (row-1, col),
                                      (row, col+1), (row, col-1),
                                      (row+1, col-1), (row-1, col+1),
                                      (row-1, col-1), (row+1, col+1)]
                        for (offX, offY) in offset {
                            if isValidIndex(offX, offY) {
                                inputs[offX][offY] += 1
                                if inputs[offX][offY] > 9 {
                                    queue.append((offX, offY))
                                }
                            }
                        }
                    }
                }

            }
        }

        for input in inputs {
            print(input)
        }

        return 0;
    }
}
