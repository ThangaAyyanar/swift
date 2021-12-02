public struct Day_2 {
    public private(set) var text = "Hello, World!"

    var inputs: [String]

    public init(inputs: [String]) {
        self.inputs = inputs
    }

    func part1() -> Int {
        var x = 0
        var y = 0
        for input in inputs {
            let splited_inputs = input.split(separator: " ")
            if splited_inputs.count > 1 {
                let direction = splited_inputs[0]
                let value = Int(splited_inputs[1]) ?? 0
                switch direction {
                case "forward":
                    x += value
                case "down":
                    y += value
                case "up":
                    y -= value
                default:
                    break
                }
            }
        }
        return x*y
    }

    func part2() -> Int {
        var x = 0
        var y = 0
        var aim = 0
        for input in inputs {
            let splited_inputs = input.split(separator: " ")
            if splited_inputs.count > 1 {
                let direction = splited_inputs[0]
                let value = Int(splited_inputs[1]) ?? 0
                switch direction {
                case "forward":
                    x += value
                    y += (aim * value)
                case "down":
                    aim += value
                case "up":
                    aim -= value
                default:
                    break
                }
            }
        }
        print("Value of x and y is \(x) and \(y)")
        return x*y
    }
}
