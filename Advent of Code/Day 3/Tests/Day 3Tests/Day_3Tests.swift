import XCTest
import Foundation
@testable import Day_3

final class Day_3Tests: XCTestCase {

    func test_part1_sample() {
        let inputs = ["00100","11110","10110","10111","10101","01111","00111","11100","10000","11001","00010","01010"]
        let day3 = Day_3(inputs: inputs)
        let result = day3.part1()
        XCTAssertEqual(result, 198.0)
    }

    func test_part1() {
        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let inputs = contents.components(separatedBy: .newlines)
        let day3 = Day_3(inputs: inputs)
        print("log: \(day3.part1())")
        /*dump(inputs)*/
    }

    func test_part2_sample() {
        let inputs = ["00100","11110","10110","10111","10101","01111","00111","11100","10000","11001","00010","01010"]
        let day3 = Day_3(inputs: inputs)
        let result = day3.part2()
        XCTAssertEqual(result, 230.0)
    }

    func test_part2() {
        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let inputs = contents.components(separatedBy: .newlines)
        let day3 = Day_3(inputs: inputs)
        print("log: \(day3.part2())")
    }
}
