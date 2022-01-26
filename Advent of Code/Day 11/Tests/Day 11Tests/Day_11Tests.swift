import XCTest
@testable import Day_11

final class Day_11Tests: XCTestCase {

    func test_part1_sample() {
        let fileURL = Bundle.module.url(forResource: "test1", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var new_inputs = [[Int]]()

        for input in allInputs {
            var new_int_arr = [Int]()
            for char in input {
                new_int_arr.append(Int(String(char))!)
            }
            if new_int_arr.isEmpty == false {
                new_inputs.append(new_int_arr)
            }
        }
        let day11 = Day_11(inputs: new_inputs)
        let result = day11.part1()
        print(result)
    }
}
