import XCTest
@testable import Day_12

final class Day_12Tests: XCTestCase {

    func test_part1_sample() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        var new_inputs = [String:[String]]()

        for input in allInputs {
            let splitted_string = input.split(separator: "-")
            if splitted_string.count == 2 {

                if let old_value = new_inputs[String(splitted_string[0])] {
                    new_inputs[String(splitted_string[0])]!.append(String(splitted_string[1]))
                }
                else {
                    new_inputs[String(splitted_string[0])] = [String(splitted_string[1])]
                }

                if let old_value = new_inputs[String(splitted_string[1])] {
                    new_inputs[String(splitted_string[1])]!.append(String(splitted_string[0]))
                }
                else {
                    new_inputs[String(splitted_string[1])] = [String(splitted_string[0])]
                }
            }
        }
        print(new_inputs)
        /*let day12 = Day_12(inputs: new_inputs)*/
        /*let result = day12.part1()*/
        /*print(result)*/
    }

}
