public class Day_12 {
    public private(set) var text = "Hello, World!"

    var inputs: [String: [String]]

    var path = [String]()
    var solutions = [[String]]()
    var solutionsCount = 0

    public init(inputs: [String: [String]]) {
        self.inputs = inputs
    }


    func part1_recursion() {
        let last = path.last!
        if last != "end" {
            for element in inputs[last]!{
                if element.uppercased() == element || 
                   path.contains(element) == false {

                    path.append(element)
                    part1_recursion()
                    path.removeLast()
                }
            }
        }
        else {
            solutions.append(path)
        }
    }

    func part1() -> Int{

        path.append("start")
        part1_recursion()
        return solutions.count
    }


    func part2_recursion() {
        let last = path.last!
        if last != "end" {
            for element in inputs[last]!{
                if containsAtmostTwoLowerCase(path) && 
                   element != "start" &&
                   (element.uppercased() == element || path.histogram(element) < 2) {

                    path.append(element)
                    part2_recursion()
                    path.removeLast()
                }
            }
        }
        else if containsAtmostTwoLowerCase(path) {
            solutionsCount += 1
        }
    }

    func containsAtmostTwoLowerCase(_ currentPath: [String]) -> Bool {
        let lowercaseArray = currentPath.filter{$0.uppercased() != $0}
        let setLowerArray = Set(lowercaseArray)
        return (lowercaseArray.count - setLowerArray.count) <= 1
    }

    func part2() -> Int {
        path.append("start")
        part2_recursion()
        return solutionsCount
    }
}

extension Sequence where Element: Hashable {

    func histogram(_ element: Element) -> Int {
        let countArray = self.reduce(into: [:]) { counts, elem in counts[elem, default: 0] += 1 }
        return countArray[element] ?? 0
    }
}
