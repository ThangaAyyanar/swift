public struct Position: Equatable{
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }

    public static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

public enum Folding {
    case x(Int)
    case y(Int)
}


public class Day_13 {

    let folding: [Folding]
    let allPoints: [Position]
    let maxX: Int
    let maxY: Int

    public init(folding: [Folding], allPoints: [Position], maxX: Int, maxY: Int) {
        self.folding = folding
        self.allPoints = allPoints
        self.maxX = maxX
        self.maxY = maxY
    }


    func part1() {

        var newPoints = allPoints

        let fold = folding.first!

        var tempPoints = [Position]()

        switch fold {
        case .x(let value):
            for position in newPoints {
                let x = position.x
                if x > value {
                    let newX = value - (position.x - value)
                    tempPoints.append(Position(newX, position.y))
                }
                else {
                    tempPoints.append(position)
                }
            }

        case .y(let value):
            for position in newPoints {
                let y = position.y
                if y > value {
                    let newY = value - (position.y - value)
                    tempPoints.append(Position(position.x, newY))
                }
                else {
                    tempPoints.append(position)
                }
            }

        }
        newPoints = tempPoints
    

        var uniquePoints = [Position]()
        for point in newPoints {
            if !uniquePoints.contains(point) {
                uniquePoints.append(point)
            }
        }
        print(uniquePoints.count)

    }

    func part2() {

        var newPoints = allPoints

        for fold in folding {

            var tempPoints = [Position]()

            switch fold {
            case .x(let value):
                for position in newPoints {
                    let x = position.x
                    if x > value {
                        let newX = value - (position.x - value)
                        tempPoints.append(Position(newX, position.y))
                    }
                    else {
                        tempPoints.append(position)
                    }
                }
            case .y(let value):
                for position in newPoints {
                    let y = position.y
                    if y > value {
                        let newY = value - (position.y - value)
                        tempPoints.append(Position(position.x, newY))
                    }
                    else {
                        tempPoints.append(position)
                    }
                }
            }
            newPoints = tempPoints
        }
        print(newPoints)

    }

    // Understand the problem

    /*func display(grid: [[Int]]) {*/

        /*for values in grid {*/
            /*for value in values {*/
                /*print("\(value)", terminator: "")*/
            /*}*/
            /*print("")*/
        /*}*/
    /*}*/

    /*func part1_new() {*/

        /*var grid = Array(repeating: Array(repeating: 0, count: maxX+1), count: maxY+1)*/

        /*for position in allPoints{*/
            /*grid[position.y][position.x] = 1*/
        /*}*/

        /*var newPoints = allPoints*/

        /*for fold in folding {*/
            /*var tempPoints = [Position]()*/
            /*if case Folding.x(let value) = fold {*/
                /*for position in newPoints {*/
                    /*let x = position.x*/
                    /*if x > value {*/
                        /*let newX = maxX - x*/
                        /*grid[position.y][newX] = 1*/
                        /*grid[position.y][position.x] = 0*/
                        /*tempPoints.append(Position(newX, position.y))*/
                    /*}*/
                    /*else {*/
                        /*tempPoints.append(position)*/
                    /*}*/
                /*}*/
                /*newPoints = tempPoints*/
            /*}*/
            /*else if case Folding.y(let value) = fold {*/
                /*for position in newPoints {*/
                    /*let y = position.y*/
                    /*if y > value {*/
                        /*let newY = maxY - y*/
                        /*grid[newY][position.x] = 1*/
                        /*grid[position.y][position.x] = 0*/
                        /*tempPoints.append(Position(position.x, newY))*/
                    /*}*/
                    /*else {*/
                        /*tempPoints.append(position)*/
                    /*}*/
                /*}*/
                /*newPoints = tempPoints*/
            /*}*/
        /*}*/

    /*}*/

}
