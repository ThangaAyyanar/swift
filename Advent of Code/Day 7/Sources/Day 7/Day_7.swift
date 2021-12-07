public struct Day_7 {

    let inputs: [Int]

    public init(inputs: [Int]) {
        self.inputs = inputs
    }

    func find_largest_element() -> Int {
        var largest = -1
        for input in inputs {
            if input > largest {
                largest = input
            }
        }
        return largest
    }

    func part1() -> Int {
        let largestElement = find_largest_element()
        var min = Int.max
        /*print(largestElement)*/
        for position in 0...largestElement {
            var totalFuel = 0
            for input in inputs {
                let fuel = abs(input - position)
                totalFuel += fuel
            }
            /*print("\(position) has \(totalFuel)")*/
            if totalFuel < min {
                min = totalFuel
            }
        }
        /*print(min)*/
        return min
    }

    func part2() -> Int {
        let largestElement = find_largest_element()
        var max = Int.max
        for position in 0...largestElement {
            var totalFuel = 0
            for input in inputs {
                let fuel = abs(input - position)
                let newFuel = (fuel*(fuel+1))/2
                /*print("Move from \(input) to \(position) = \(newFuel)")*/
                totalFuel += newFuel
            }
            /*print("\(position) has \(totalFuel)")*/
            if totalFuel < max {
                max = totalFuel
            }
        }
        /*print(max)*/
        return max
    }
}
