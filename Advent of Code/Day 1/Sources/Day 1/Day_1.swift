public struct Day_1 {
    public private(set) var text = "Hello, World!"

    var inputs: [Int]

    public init(inputs: [Int]) {
        self.inputs = inputs
    }

    func depthIncreaseOccurence() -> Int {
        var occurenceCount = 0
        for index in 1..<inputs.count {
            let previousIndex = index - 1
            if inputs[index] > inputs[previousIndex] {
                occurenceCount += 1
            }
        }
        return occurenceCount
    }

    func threeSlideWindowIncreaseOccurence() -> Int {
        var occurenceCount = 0
        for index in 3..<inputs.count {
            let previousIndex = index - 3
            if inputs[index] > inputs[previousIndex] {
                occurenceCount += 1
            }
        }
        return occurenceCount
    }

    func threeSlideWindowIncreaseOccurence_overkill() -> Int {
        var occurenceCount = 0
        var queue = [Int]()
        var intermediateSum1 = 0
        var intermediateSum2 = 0
        for index in 0..<inputs.count {
            if queue.count < 3 {
                // print("log: Intial")
                intermediateSum1 += inputs[index]
            }
            else {
                intermediateSum2 = intermediateSum1 - queue[0] + inputs[index]
                // print("log: queue \(queue) intermediateSum1 \(intermediateSum1) sum2 \(intermediateSum2)")
                if intermediateSum2 > intermediateSum1 {
                    occurenceCount += 1
                }
                intermediateSum1 = intermediateSum2
                queue = [Int](queue.dropFirst())
            }
            queue.append(inputs[index])
        }
        return occurenceCount
    }
}
