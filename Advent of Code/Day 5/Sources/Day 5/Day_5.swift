public struct Direction: Hashable {
    let x: Int
    let y: Int
}
public struct Position {
    let start: Direction
    let end: Direction
}

public struct Day_5 {

    var positions: [Position]

    public init(positions: [Position]) {
        self.positions = positions
    }

    func part1() {
        var matrix = [Direction: Int]()
        for position in positions {

            if position.start.x == position.end.x || 
               position.start.y == position.end.y {

                for x in position.start.x...position.end.x {

                    for y in position.start.y...position.end.y {

                        let direction = Direction(x: x, y: y)
                        if matrix[direction] == nil {
                            matrix[direction] = 0
                        }
                        matrix[direction]! += 1
                    }
                }
            }
        }

        var count = 0
        for (_, value) in matrix {
            if value > 1 {
                count += 1
            }
        }
        print(count)
    }

    func part2() {
        var matrix = [Direction: Int]()
        for position in positions {

            let dx = abs(position.end.x - position.start.x)
            let dy = abs(position.end.y - position.start.y)

            if position.start.x == position.end.x || 
               position.start.y == position.end.y {

                for x in position.start.x...position.end.x {

                    for y in position.start.y...position.end.y {

                        let direction = Direction(x: x, y: y)
                        if matrix[direction] == nil {
                            matrix[direction] = 0
                        }
                        matrix[direction]! += 1
                    }
                }
            }
            else if (dx == dy){

                var initialx = position.start.x
                var initialy = position.start.y

                let endy = position.end.y

                while initialx != position.end.x && initialy != endy {

                    let direction = Direction(x: initialx, y: initialy)
                    if matrix[direction] == nil {
                        matrix[direction] = 0
                    }
                    matrix[direction]! += 1


                    if initialy > endy {
                        initialy -= 1
                    }
                    else if initialy < endy{
                        initialy += 1
                    }

                    if initialx > position.end.x {
                        initialx -= 1
                    }
                    else if initialx < position.end.x{
                        initialx += 1
                    }
                }
                let direction = Direction(x: initialx, y: initialy)
                if matrix[direction] == nil {
                    matrix[direction] = 0
                }
                matrix[direction]! += 1
            }

        }

        /*for x in 0...9 {*/
            /*for y in 0...9 {*/
                /*if let value = matrix[Direction(x:x, y: y)] {*/
                    /*print("\(value)", terminator: " ")*/
                /*}*/
                /*else {*/
                    /*print("0", terminator: " ")*/
                /*}*/
            /*}*/
            /*print()*/
        /*}*/



        var count = 0
        for (_, value) in matrix {
            if value > 1 {
                count += 1
            }
        }
        print(count)
    }
}
