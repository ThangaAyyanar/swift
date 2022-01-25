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

    func part2() -> Int {

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

                        break
                    }
                }
            }
            if stack.isEmpty == false {
                for char in stack {
                    count += getSyntaxScorePart2(char: char)
                }
            }
        }
        return count
    }
}
