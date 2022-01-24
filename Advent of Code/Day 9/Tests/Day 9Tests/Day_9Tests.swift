import XCTest
@testable import Day_9

final class Day_9Tests: XCTestCase {

    func test_part1_sample() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
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
        let day9 = Day_9(inputs: new_inputs)
        let result = day9.part1()
        print(result)
    }

    func test_part1() {
        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
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
        let day9 = Day_9(inputs: new_inputs)
        let result = day9.part1()
        print(result)
    }
    
}
