import XCTest
@testable import Day_13

final class Day_13Tests: XCTestCase {

    func process_inputs(allInputs: [String]) -> (allPoints: [Position], folding: [Folding], maxX: Int, maxY: Int) {
        var allPoints = [Position]()
        var folding = [Folding]()
        var maxX = 0
        var maxY = 0

        for input in allInputs {
            if input.isEmpty {
                continue
            }
            else if input.hasPrefix("fold along y=") {

                let points = input.split(separator: "=")
                folding.append(Folding.y(Int(points[1])!))
            }
            else if input.hasPrefix("fold along x=") {

                let points = input.split(separator: "=")
                folding.append(Folding.x(Int(points[1])!))
            }
            else {
                let points = input.split(separator: ",")
                let x = Int(points[0])!
                let y = Int(points[1])!
                allPoints.append(Position(x, y))
                if x > maxX {
                    maxX = x
                }
                if y > maxY {
                    maxY = y
                }
            }
        }
        return (allPoints: allPoints, folding: folding, maxX: maxX, maxY: maxY)
    }

    func test_part1_sample() {

        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        let processed_inputs = process_inputs(allInputs: allInputs)

        let day13 = Day_13(folding: processed_inputs.folding, allPoints: processed_inputs.allPoints, maxX: processed_inputs.maxX, maxY:processed_inputs.maxY)
        day13.part1()

    }

    func test_part1() {

        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        let processed_inputs = process_inputs(allInputs: allInputs)

        let day13 = Day_13(folding: processed_inputs.folding, allPoints: processed_inputs.allPoints, maxX: processed_inputs.maxX, maxY:processed_inputs.maxY)
        day13.part1()

    }

    func test_part2_sample() {

        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        let processed_inputs = process_inputs(allInputs: allInputs)

        let day13 = Day_13(folding: processed_inputs.folding, allPoints: processed_inputs.allPoints, maxX: processed_inputs.maxX, maxY:processed_inputs.maxY)
        day13.part2()

    }

    func test_part2() {

        let fileURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

        let processed_inputs = process_inputs(allInputs: allInputs)

        let day13 = Day_13(folding: processed_inputs.folding, allPoints: processed_inputs.allPoints, maxX: processed_inputs.maxX, maxY:processed_inputs.maxY)
        day13.part2()
        // plot the point in Desmos and found the answer
        //ALREKFKU
    }
}
