public struct Day_6 {

    let inputs: [Int]

    public init(inputs: [Int]) {
        self.inputs = inputs
    }

    func generationCounter(to: Int) -> Int {
        var newInputs = inputs
        for _ in 0..<to {
            for (index,input) in newInputs.enumerated() {
                if input == 0 {
                    newInputs[index] = 6
                    newInputs.append(8)
                }
                else {
                    newInputs[index] -= 1
                }
            }
        }
        return newInputs.count
    }


    func efficientGenerationCounter(to: Int) -> Int {
        var inputDict = [Int: Int]()
        for input in inputs {
            if inputDict[input] == nil {
                inputDict[input] = 0
            }
            inputDict[input]! += 1
        }

        for _ in 0..<to {

            var tempDict = [Int: Int]()
            for i in  0..<9 {
                tempDict[i] = 0
            }

            for (key, value) in inputDict {
                if key == 0 {
                    tempDict[6]! += value
                    tempDict[8]! += value
                }
                else {
                    tempDict[key-1]! += value
                }
            }
            inputDict = tempDict
        }

        return inputDict.values.reduce(0,+)
    }

    func part1() -> Int {
        return generationCounter(to: 80)
    }

    func part2() -> Int {
        return efficientGenerationCounter(to: 256)
    }
}
