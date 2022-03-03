import XCTest
@testable import Day_13

final class Day_13Tests: XCTestCase {

    func test_part1_sample() {

        let fileURL = Bundle.module.url(forResource: "test", withExtension: "txt")!
        let contents = try! String(contentsOf: fileURL, encoding: .utf8)
        let allInputs = contents.components(separatedBy: .newlines)

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
                print(points)
                folding.append(Folding.y(Int(points[1])!))
            }
            else if input.hasPrefix("fold along x=") {

                let points = input.split(separator: "=")
                print(points)
                folding.append(Folding.x(Int(points[1])!))
            }
            else {
                let points = input.split(separator: ",")
                print(points)
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


        print(allPoints)
        print(folding)
        print(maxX)
        print(maxY)
    }
}
