import XCTest
import Foundation
@testable import Day_4

final class Day_4Tests: XCTestCase {

    func test_part1_sample() {
        let inputs = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
        let board1 = [[22,13,17,11,0],[8,2,23,4,24],[21,9,14,16,7],[6,10,3,18,5],[1,12,20,15,19]]
        let board2 = [[3,15,0,2,22],[9,18,13,17,5],[19,8,7,25,23],[20,11,10,24,4],[14,21,16,12,6]]
        let board3 = [[14,21,17,24,4],[10,16,15,9,19],[18,8,23,26,20],[22,11,13,6,5],[2,0,12,3,7]]
        let boards = [Board(elements:board1), Board(elements:board2), Board(elements:board3)]
        let hashSet = Day_4.prepareHashSet(boards: boards)
        let day4 = Day_4(inputs: inputs, boards: boards, hashSet: hashSet)
        let result = day4.part1()
        XCTAssertEqual(result, 4512)
    }


    func test_part1() {
        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        let inputs = allInputs[0].split(separator:",").compactMap{Int($0)}
        
        var boards = [Board]()
        var boardTemp = [[Int]]()
        for index in 2..<allInputs.count {
            let input = allInputs[index]
            if input.isEmpty {
                boards.append(Board(elements: boardTemp))
                boardTemp = [[Int]]()
            }
            else {
                let boardtemp = allInputs[index].split(separator: " ").compactMap{Int($0)}
                boardTemp.append(boardtemp)
            }
        }

        let hashSet = Day_4.prepareHashSet(boards: boards)
        let day4 = Day_4(inputs: inputs, boards: boards, hashSet: hashSet)
        let result = day4.part1()
        print(result)
    }

    func test_part2_sample() {
        let inputs = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
        let board1 = [[22,13,17,11,0],[8,2,23,4,24],[21,9,14,16,7],[6,10,3,18,5],[1,12,20,15,19]]
        let board2 = [[3,15,0,2,22],[9,18,13,17,5],[19,8,7,25,23],[20,11,10,24,4],[14,21,16,12,6]]
        let board3 = [[14,21,17,24,4],[10,16,15,9,19],[18,8,23,26,20],[22,11,13,6,5],[2,0,12,3,7]]
        let boards = [Board(elements:board1), Board(elements:board2), Board(elements:board3)]
        let hashSet = Day_4.prepareHashSet(boards: boards)
        let day4 = Day_4(inputs: inputs, boards: boards, hashSet: hashSet)
        let result = day4.part2()
        XCTAssertEqual(result, 1924)
    }

    func test_part2() {
        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        let inputs = allInputs[0].split(separator:",").compactMap{Int($0)}
        
        var boards = [Board]()
        var boardTemp = [[Int]]()
        for index in 2..<allInputs.count {
            let input = allInputs[index]
            if input.isEmpty {
                boards.append(Board(elements: boardTemp))
                boardTemp = [[Int]]()
            }
            else {
                let boardtemp = allInputs[index].split(separator: " ").compactMap{Int($0)}
                boardTemp.append(boardtemp)
            }
        }

        let hashSet = Day_4.prepareHashSet(boards: boards)
        let day4 = Day_4(inputs: inputs, boards: boards, hashSet: hashSet)
        let result = day4.part2()
        print(result)
    }
}
