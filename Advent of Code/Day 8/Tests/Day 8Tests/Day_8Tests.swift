import XCTest
import Foundation
@testable import Day_8

final class Day_8Tests: XCTestCase {

    func test_part1_sample() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var signalOutputs = [String]()

        for input in allInputs {

            let splitString = input.components(separatedBy:" | ")

            if splitString.count > 1 {

                let signalArray = splitString[1].split(separator: " ").compactMap{String($0)}
                signalOutputs.append(contentsOf: signalArray)
            }
        }
        let day8 = Day_8(inputs: signalOutputs)
        let result = day8.part1()
        XCTAssertEqual(result, 26)
    }

    func test_part1() {
        let fileURL = Bundle.module.url(forResource: "inputs", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var signalOutputs = [String]()

        for input in allInputs {

            let splitString = input.components(separatedBy:" | ")

            if splitString.count > 1 {

                let signalArray = splitString[1].split(separator: " ").compactMap{String($0)}
                signalOutputs.append(contentsOf: signalArray)
            }
        }
        let day8 = Day_8(inputs: signalOutputs)
        print(day8.part1())
    }

    func test_part2_sample() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var signalOutputs = [[String]]()
        var signalInputs = [[String]]()

        for input in allInputs {

            let splitString = input.components(separatedBy:" | ")

            if splitString.count > 1 {

                let signalArrayInputs = splitString[0].split(separator: " ").compactMap{String($0)}
                let signalArray = splitString[1].split(separator: " ").compactMap{String($0)}
                signalInputs.append(signalArrayInputs)
                signalOutputs.append(signalArray)
            }
        }
        let day8 = Day_8(inputs: [String](), signalInputs: signalInputs, signalOutputs: signalOutputs)
        let result = day8.part2()
        XCTAssertEqual(result, 61229)
    }

    func test_part2() {
        let fileURL = Bundle.module.url(forResource: "inputs", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var signalOutputs = [[String]]()
        var signalInputs = [[String]]()

        for input in allInputs {

            let splitString = input.components(separatedBy:" | ")

            if splitString.count > 1 {

                let signalArrayInputs = splitString[0].split(separator: " ").compactMap{String($0)}
                let signalArray = splitString[1].split(separator: " ").compactMap{String($0)}
                signalInputs.append(signalArrayInputs)
                signalOutputs.append(signalArray)
            }
        }
        let day8 = Day_8(inputs: [String](), signalInputs: signalInputs, signalOutputs: signalOutputs)
        let result = day8.part2()
        print(result)
    }}
