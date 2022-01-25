
public struct Position: Equatable{
    var x,y: Int

    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

public class Day_9 {

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

    func part2() -> Int {
        var basin = [Int]()
        for (row, input) in inputs.enumerated() {
            for (col, _) in input.enumerated() {

                var queue = [Position]()
                queue.append(Position(row, col))
                var visited = [Position]()
                var count = 0

                while queue.count > 0 {
                    if visited.contains(queue[0]) == false && get_data(x: queue[0].x, y: queue[0].y) < 9 {

                        let _row = queue[0].x
                        let _col = queue[0].y
                        visited.append(Position(_row, _col))
                        count += 1
                        queue.append(contentsOf: [Position(_row - 1, _col),Position(_row + 1, _col),Position(_row,_col + 1),Position(_row,_col - 1)])
                    }
                    queue.removeFirst()
                }

                for position in visited {
                    inputs[position.x][position.y] = 11
                }
                if count > 0 {
                    basin.append(count)
                }
            }
        }
        /*print(basin.sorted(by: >))*/
        return basin.sorted(by: >)[..<3].reduce(1) { $0 * $1 }
    }
}
