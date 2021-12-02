import XCTest
import Foundation
@testable import Day_2

final class Day_2Tests: XCTestCase {

    func test_part1_sample() {
        let inputs = ["forward 5","down 5","forward 8","up 3","down 8","forward 2"]
        let day2 = Day_2(inputs: inputs)
        XCTAssertEqual(day2.part1(), 150)
    }

    func test_part1() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let inputs = contents.components(separatedBy: .newlines)
        let day2 = Day_2(inputs: inputs)
        print("log: \(day2.part1())")
        /*dump(inputs)*/
    }

    func test_part2_sample() {
        let inputs = ["forward 5","down 5","forward 8","up 3","down 8","forward 2"]
        let day2 = Day_2(inputs: inputs)
        XCTAssertEqual(day2.part2(), 900)
    }

    func test_part2() {
        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let inputs = contents.components(separatedBy: .newlines)
        let day2 = Day_2(inputs: inputs)
        print("log: \(day2.part2())")
        /*dump(inputs)*/
    }
}
