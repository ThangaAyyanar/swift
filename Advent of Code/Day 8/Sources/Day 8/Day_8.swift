public struct Day_8 {

    let inputs: [String]
    let signalInputs: [[String]]
    let signalOutputs: [[String]]

    public init(inputs: [String], signalInputs: [[String]] = [[String]](), signalOutputs: [[String]] = [[String]]()) {
        self.inputs = inputs
        self.signalInputs = signalInputs
        self.signalOutputs = signalOutputs
    }


    func part1() -> Int{
        /*1 - 2*/
        /*4 - 4*/
        /*7 - 3*/
        /*8 - 7*/
        let segmentDict = [2, 3, 4, 7]

        var count = 0
        for input in inputs {
            if segmentDict.contains(input.count) {
                count += 1
            }
        }
        return count
    }

    func part2() -> Int{

        var count = 0
        for (signalIndex,signalInput) in signalInputs.enumerated() {

            var stringDict = [String: Int]()
            var tempDict = [Int: String]()
            var visited = Array(repeating: -1, count: 10)

            for (index,input) in signalInput.enumerated() {
                if input.count == 2 {
                    stringDict[input] = 1
                    tempDict[1] = input
                    visited[index] = 1
                }
                if input.count == 3 {
                    tempDict[7] = input
                    stringDict[input] = 7
                    visited[index] = 1
                }
                if input.count == 4 {
                    tempDict[4] = input
                    stringDict[input] = 4
                    visited[index] = 1
                }
                if input.count == 7 {
                    tempDict[8] = input
                    stringDict[input] = 8
                    visited[index] = 1
                }
            }

            for (index,input) in signalInput.enumerated() {

                if input.count == 6 {
                    if input.containsAll(tempDict[1]!) {
                        if input.containsAll(tempDict[4]!) {
                            stringDict[input] = 9
                            visited[index] = 1
                        }
                        else {
                            stringDict[input] = 0
                            visited[index] = 1
                        }
                    }
                    else {
                        stringDict[input] = 6
                        visited[index] = 1
                    }

                }
                else if input.count == 5 {
                    if input.containsAll(tempDict[7]!) {
                        stringDict[input] = 3
                        visited[index] = 1
                    }
                    else if input.containsAllExceptOne(tempDict[4]!) {
                        stringDict[input] = 5
                        visited[index] = 1
                    }
                    else {
                        stringDict[input] = 2
                        visited[index] = 1
                    }
                }
            }

            var value = 0
            for output in signalOutputs[signalIndex] {
                for (input, _value) in stringDict {
                    if input.premuteEqualAll(output) {
                        value = (value * 10) + _value
                    }
                }
            }
            count += value
            /*print(value)*/
        }

        /*print(count)*/
        return count
    }
}


private extension String {

     func containsAll(_ string: String) -> Bool {
        let lookupChars = Set(string.map { $0 })
        let chars = Set(self.map { $0 })

        let union = chars.intersection(lookupChars)
        return union.count == lookupChars.count
    }

     func containsAllExceptOne(_ string: String) -> Bool {
        let lookupChars = Set(string.map { $0 })
        let chars = Set(self.map { $0 })

        let union = chars.intersection(lookupChars)
        return union.count == lookupChars.count - 1
    }

     func premuteEqualAll(_ string: String) -> Bool {

        guard self.count == string.count else { return false }

        let lookupChars = Set(string.map { $0 })
        let chars = Set(self.map { $0 })

        let union = chars.intersection(lookupChars)
        return union.count == lookupChars.count
    }
}
