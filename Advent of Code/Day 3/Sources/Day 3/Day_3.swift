import Foundation

struct Digit {
    var zero: Int
    var one: Int

    init() {
        self.zero = 0
        self.one = 0
    }

    mutating func incrementOne() {
        self.one += 1
    }

    mutating func incrementZero() {
        self.zero += 1
    }
}

public class Day_3 {

    var inputs: [String]
    var tempHashSet = [Int: Digit]()

    public init(inputs: [String]) {
        self.inputs = inputs
    }

    func getMostCommonDigits() {
        for input in inputs {
            for (index,digit) in input.enumerated() {
                if tempHashSet[index] == nil {
                    tempHashSet[index] = Digit()
                }
                if digit == "0" {
                    tempHashSet[index]!.incrementZero()
                }
                else if digit == "1" {
                    tempHashSet[index]!.incrementOne()
                }
            }
        }
    }

    func part1() -> Double {
        getMostCommonDigits()

        var gamma:Double = 0
        var epsilon:Double = 0
        for index in 0..<tempHashSet.count {
            let power = tempHashSet.count - index - 1
            if let value = tempHashSet[index] {
                let newValue = value.zero > value.one ? 0 : 1
                if newValue == 1 {
                    gamma += pow(2.0, Double(power))
                }
                else {
                    epsilon += pow(2.0, Double(power))
                }
            }
        }
        return gamma*epsilon
    }

    func mostCommonDigit(indexes: [Int], position: Int, isMost: Bool) -> [Int] {
        var zeroCount = 0
        var zeroIndexes = [Int]()
        var oneCount = 0
        var oneIndexes = [Int]()

        for index in indexes {
            let input = inputs[index]
            /*print("position: \(input)")*/
            if input.isEmpty {
                continue
            }
            let digit = input[position]
            if digit == "0" {
                zeroCount += 1
                zeroIndexes.append(index)
            }
            else if digit == "1" {
                oneCount += 1
                oneIndexes.append(index)
            }
        }

        if isMost {
            return oneCount >= zeroCount ? oneIndexes : zeroIndexes
        }
        else {
            return oneCount >= zeroCount ? zeroIndexes : oneIndexes

        }
    }

    func convertDecimal(input: String) -> Double {
        var result: Double = 0
        for (index, char) in input.enumerated() {
            let power = input.count - index - 1
            let newValue = char == "0" ? 0 : 1
            if newValue == 1 {
                result += pow(2.0, Double(power))
            }
        }
        return result
    }

    func part2() -> Double {

        let length = inputs[0].count
        
        let strideSequence = stride(from: 0, to: inputs.count, by: 1) 

        var oldIndexes = Array(strideSequence)
        for index in 0..<length {
            if oldIndexes.count == 1 {
                break
            }
            oldIndexes = mostCommonDigit(indexes: oldIndexes, position: index, isMost: true)
        }
        let value1 = convertDecimal(input: inputs[oldIndexes[0]])

        oldIndexes = Array(strideSequence)
        for index in 0..<length {
            if oldIndexes.count == 1 {
                break
            }
            oldIndexes = mostCommonDigit(indexes: oldIndexes, position: index, isMost: false)
        }
        let value2 = convertDecimal(input: inputs[oldIndexes[0]])

        return value1 * value2
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
