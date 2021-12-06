import XCTest
import Foundation
@testable import Day_5

final class Day_5Tests: XCTestCase {

    /*func test_part1_sample() {*/
        /*let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!*/
        /*let contents = try! String(contentsOf: fileURL, encoding: .utf8)*/
        /*let allInputs = contents.components(separatedBy: .newlines)*/

        /*var positions = [Position]()*/

        /*for input in allInputs {*/

            /*let splitString = input.components(separatedBy:" -> ")*/

            /*if splitString.count > 1 {*/

                /*let starting = splitString[0].split(separator: ",")*/
                /*var startDate = Direction(x: Int(starting[0])!, y: Int(starting[1])!)*/
                /*let ending = splitString[1].split(separator: ",")*/
                /*var endDate = Direction(x: Int(ending[0])!, y: Int(ending[1])!)*/

                /*if startDate.x > endDate.x || (startDate.x >= endDate.x && startDate.y > endDate.y) {*/
                    /*let temp = startDate*/
                    /*startDate = endDate*/
                    /*endDate = temp*/
                /*}*/

                /*positions.append(Position(start: startDate, end: endDate))*/
            /*}*/
        /*}*/
        /*dump(positions)*/

        /*let day5 = Day_5(positions: positions)*/
        /*day5.part1()*/
    /*}*/

    /*func test_part1() {*/
        /*let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!*/
        /*let contents = try! String(contentsOf: fileURL, encoding: .utf8)*/
        /*let allInputs = contents.components(separatedBy: .newlines)*/

        /*var positions = [Position]()*/

        /*for input in allInputs {*/

            /*let splitString = input.components(separatedBy:" -> ")*/

            /*if splitString.count > 1 {*/

                /*let starting = splitString[0].split(separator: ",")*/
                /*var startDate = Direction(x: Int(starting[0])!, y: Int(starting[1])!)*/
                /*let ending = splitString[1].split(separator: ",")*/
                /*var endDate = Direction(x: Int(ending[0])!, y: Int(ending[1])!)*/

                /*if startDate.x > endDate.x || (startDate.x >= endDate.x && startDate.y > endDate.y) {*/
                    /*let temp = startDate*/
                    /*startDate = endDate*/
                    /*endDate = temp*/
                /*}*/

                /*positions.append(Position(start: startDate, end: endDate))*/
            /*}*/
        /*}*/

        /*let day5 = Day_5(positions: positions)*/
        /*day5.part1()*/
    /*}*/

    func test_part2_sample() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var positions = [Position]()

        for input in allInputs {

            let splitString = input.components(separatedBy:" -> ")

            if splitString.count > 1 {

                let starting = splitString[0].split(separator: ",")
                var startDate = Direction(x: Int(starting[0])!, y: Int(starting[1])!)
                let ending = splitString[1].split(separator: ",")
                var endDate = Direction(x: Int(ending[0])!, y: Int(ending[1])!)

                if startDate.x > endDate.x || (startDate.x >= endDate.x && startDate.y > endDate.y) {
                    let temp = startDate
                    startDate = endDate
                    endDate = temp
                }

                positions.append(Position(start: startDate, end: endDate))
            }
        }

        let day5 = Day_5(positions: positions)
        day5.part2()
    }

    func test_part2() {
        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var positions = [Position]()

        for input in allInputs {

            let splitString = input.components(separatedBy:" -> ")

            if splitString.count > 1 {

                let starting = splitString[0].split(separator: ",")
                var startDate = Direction(x: Int(starting[0])!, y: Int(starting[1])!)
                let ending = splitString[1].split(separator: ",")
                var endDate = Direction(x: Int(ending[0])!, y: Int(ending[1])!)

                if startDate.x > endDate.x || (startDate.x >= endDate.x && startDate.y > endDate.y) {
                    let temp = startDate
                    startDate = endDate
                    endDate = temp
                }

                positions.append(Position(start: startDate, end: endDate))
            }
        }

        let day5 = Day_5(positions: positions)
        day5.part2()
    }
}
