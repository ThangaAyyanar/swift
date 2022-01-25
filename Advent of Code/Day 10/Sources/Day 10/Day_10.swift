public struct Day_10 {

    var inputs: [String]

    public init(inputs: [String]) {
        self.inputs = inputs
    }

    func getSyntaxScore(char: String) -> Int {
        switch char {
        case ")":
            return 3
        case "]":
            return 57
        case "}":
            return 1197
        case ">":
            return 25137
        default:
            return 0
        }
    }

    func part1() -> Int {

        var count = 0
        for input in inputs {
            var stack = [String]()
            for _char in input {
                let char = String(_char)
                if char == "(" || char == "[" || char == "{" || char == "<" {
                    stack.append(char)
                }
                else if let last = stack.popLast() {

                    if  (last == "(" && char != ")") ||
                        (last == "[" && char != "]") ||
                        (last == "{" && char != "}") ||
                        (last == "<" && char != ">"){

                        count += getSyntaxScore(char: char)
                        break
                    }
                }
            }
        }
        return count
    }

    func getSyntaxScorePart2(char: String) -> Int {
        switch char {
        case "(":
            return 1
        case "[":
            return 2
        case "{":
            return 3
        case "<":
            return 4
        default:
            return 0
        }
    }

    func part2() -> Int {

        var count = [Int]()
        for input in inputs {
            var stack = [String]()
            var isCorrupted = false
            for _char in input {
                let char = String(_char)
                if char == "(" || char == "[" || char == "{" || char == "<" {
                    stack.append(char)
                }
                else if let last = stack.popLast() {

                    if  (last == "(" && char != ")") ||
                        (last == "[" && char != "]") ||
                        (last == "{" && char != "}") ||
                        (last == "<" && char != ">"){

                        isCorrupted = true
                    }
                }
            }
            if isCorrupted == false && stack.isEmpty == false {
                var localCount = 0
                for char in stack.reversed() {
                    localCount = (localCount * 5) + getSyntaxScorePart2(char: char)
                }
                /*print("\(stack.joined()) and its count is \(localCount)")*/
                count.append(localCount)
            }
        }
        return count.sorted()[count.count/2]
    }
}
