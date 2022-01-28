import XCTest
@testable import Day_12

final class Day_12Tests: XCTestCase {

    func test_part1_sample() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var new_inputs = [String:String]()

        for input in allInputs {
            let splited_string = input.split(separator: " - ")
        }
        let day12 = Day_12(inputs: new_inputs)
        let result = day12.part1()
        print(result)
    }

}
