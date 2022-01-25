import XCTest
@testable import Day_10

final class Day_10Tests: XCTestCase {

     func test_part1_sample() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var new_inputs = [String]()

        for input in allInputs {
            if input.isEmpty == false {
                new_inputs.append(input)
            }
        }
        let day10 = Day_10(inputs: new_inputs)
        let result = day10.part1()
        print(result)
    }

     func test_part1() {
        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var new_inputs = [String]()

        for input in allInputs {
            if input.isEmpty == false {
                new_inputs.append(input)
            }
        }
        let day10 = Day_10(inputs: new_inputs)
        let result = day10.part1()
        print(result)
    }

     func test_part2_sample() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var new_inputs = [String]()

        for input in allInputs {
            if input.isEmpty == false {
                new_inputs.append(input)
            }
        }
        let day10 = Day_10(inputs: new_inputs)
        let result = day10.part2()
        print(result)
    }

     func test_part2() {
        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var new_inputs = [String]()

        for input in allInputs {
            if input.isEmpty == false {
                new_inputs.append(input)
            }
        }
        let day10 = Day_10(inputs: new_inputs)
        let result = day10.part2()
        print(result)
    }
}
