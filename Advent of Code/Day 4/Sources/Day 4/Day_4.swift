public class Board {

    var elements: [[Int]]

    public init(elements: [[Int]]) {
        self.elements = elements
    }

    static func emptyBoard() -> Board {
        let newElements = Array(repeating: Array(repeating: -1, count: 5), count: 5)
        return Board(elements: newElements)
    }

  func printBoard() {
        for row in elements {
            for column in row {
                print("\(column)", terminator:"\t")
            }
            print()
        }
    }
}

public struct ArrayPosition {
    let board: Int
    let x: Int
    let y: Int

    public init(board: Int, x: Int, y: Int) {
        self.x = x
        self.y = y
        self.board = board
    }
}

public struct Day_4 {

    var inputs: [Int]
    var boards: [Board]
    var hashSet: [Int: [ArrayPosition]]
    var bingoBoards: [Board]

    public init(inputs: [Int], boards: [Board], hashSet: [Int: [ArrayPosition]]) {
        self.inputs = inputs
        self.boards = boards
        self.hashSet = hashSet
        var tmpBoard = [Board]()
        for _ in 0..<boards.count {
            tmpBoard.append(Board.emptyBoard())
        }
        self.bingoBoards = tmpBoard
    }

    static func prepareHashSet(boards: [Board]) -> [Int: [ArrayPosition]] {
        var tmpHashSet = [Int: [ArrayPosition]]()
        for (index,board) in boards.enumerated() {
            for (rowIndex, row) in board.elements.enumerated() {
                for (columnIndex, value) in row.enumerated() {
                    if let _ = tmpHashSet[value] {
                        tmpHashSet[value]!.append(ArrayPosition(board: index,x: rowIndex, y: columnIndex))
                    }else {
                        tmpHashSet[value] = [ArrayPosition(board: index,x: rowIndex, y: columnIndex)]
                    }
                }
            }
        }
        return tmpHashSet
    }

    func isBingo(position: ArrayPosition, index: Int) -> Bool {

        bingoBoards[index].elements[position.x][position.y] = 1

        if position.x < 0 || position.x > 4 {
            return false
        }

        var rowBingo = true
        var columnBingo = true

        let bingoBoard = bingoBoards[index]

        for index in 0..<5 {
            let x = position.x
            let y = position.y
            if bingoBoard.elements[index][y] == -1 {
                rowBingo = false
            }
            if bingoBoard.elements[x][index] == -1 {
                columnBingo = false
            }
        }
        return (rowBingo || columnBingo)
    }

    func getFinalValue(index: Int) -> Int {
        let board = boards[index]
        var result = 0
        for (rowIndex, row) in board.elements.enumerated() {
            for (columnIndex, value) in row.enumerated() {
                if bingoBoards[index].elements[rowIndex][columnIndex] == -1 {
                    result += value
                }
            }
        }
        print("result: \(result)")
        return result
    }

    func part1() -> Int {
        var result: Int = 0
        for input in inputs {
            guard let getIndexes = hashSet[input] else { continue }
            for position in getIndexes {
                let index = position.board
                if isBingo(position: position, index: index) {
                    result = getFinalValue(index: index) * input
                    return result
                }
            }
        }
        return result
    }

    func part2() -> Int {
        var result: Int = 0
        var visited = Array(repeating: -1, count: boards.count)
        var completed = 0
        for input in inputs {
            guard let getIndexes = hashSet[input] else { continue }
            for position in getIndexes {
                let index = position.board
                if visited[index] != 1 && isBingo(position: position, index: index) {
                    completed += 1
                    visited[index] = 1
                    /*print(visited)*/
                    if completed == boards.count {
                        /*print("For board \(index)")*/
                        /*print(inputs)*/
                        /*boards[index].printBoard()*/
                        /*bingoBoards[index].printBoard()*/
                        /*print("input: \(input)")*/
                        result = getFinalValue(index: index) * input
                        return result
                    }
                }
            }
        }
        return result
    }
}
