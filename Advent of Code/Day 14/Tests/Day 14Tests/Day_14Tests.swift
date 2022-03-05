import XCTest
@testable import Day_14

final class Day_14Tests: XCTestCase {

    func process_inputs(allInputs: [String]) -> (input: String, dictionary: [String:String]) {

        var isNotInput = true
        var input = ""
        var dictionary = [String:String]()
        for _input in allInputs {
            if _input.isEmpty {
                isNotInput = false
                continue
            }
            if isNotInput {
                input = _input
            }
            else {
                let points = _input.components(separatedBy: " -> ")
                dictionary[points[0]] = points[1]
            }
        }

        return (input: input, dictionary: dictionary)
    }

    func test_part1_sample() {

        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        let processed_input = process_inputs(allInputs: allInputs)
        let day14 = Day_14(input: processed_input.input, dictionary: processed_input.dictionary)
        day14.part(iteration: 10)
        day14.part(iteration: 40)

    }

    func test_part1() {

        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        let processed_input = process_inputs(allInputs: allInputs)
        let day14 = Day_14(input: processed_input.input, dictionary: processed_input.dictionary)
        day14.part(iteration: 10)
        day14.part(iteration: 40)

    }
}
