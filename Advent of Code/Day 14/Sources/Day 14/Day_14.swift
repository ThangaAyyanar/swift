public class Day_14 {

    let input: String
    let dictionary: [String:String]

    public init(input: String, dictionary: [String: String]) {
        self.input = input
        self.dictionary = dictionary
    }

    func part(iteration: Int) {
        var inputDict = [String: Int]()

        for index in 1..<input.count {

            let initialIndex = input.index(input.startIndex, offsetBy: index-1)
            let tailIndex = input.index(input.startIndex, offsetBy: index)
            let subString = String(input[initialIndex...tailIndex])
            inputDict[subString, default: 0] += 1
        }

        for _ in 0..<iteration {
            var tempInput = [String: Int]()
            for (inputKey, value) in inputDict {
                if let newChar = dictionary[inputKey] {
                    let newKey = String(inputKey.prefix(1)) + newChar
                    let newKey2 = newChar + String(inputKey.suffix(1))
                    tempInput[newKey, default: 0] += value
                    tempInput[newKey2, default: 0] += value
                }
            }
            inputDict = tempInput
        }
        //print(inputDict)
        histogram(newInput: inputDict)
    }

    func histogram(newInput: [String: Int]) {
        var temp = [Character:Int]()
        for (value, occurence) in newInput {
            for char in value {
                temp[char, default: 0] += occurence
            }
        }
        for (key, value) in temp {
            if value % 2 == 1 {
                temp[key] = (value/2) + 1
            }
            else {
                temp[key] = value/2
            }
        }
        //print(temp)
        print(temp.values.max()! - temp.values.min()!)
    }

    // Less Efficient Way
    /*func calculatePart1(newInput: String) {*/
        /*var temp = [Character:Int]()*/
        /*for char in newInput {*/
            /*temp[char, default: 0] += 1*/
        /*}*/
        /*print(temp)*/
        /*print(temp.values.max()! - temp.values.min()!)*/
    /*}*/

    /*func part1_temp() {*/
        /*var newInput = input*/
        /*for _ in 0..<10 {*/
            /*var tempInput = newInput*/
            /*for index in 1..<newInput.count {*/
                /*let initialIndex = newInput.index(newInput.startIndex, offsetBy: index-1)*/
                /*let tailIndex = newInput.index(newInput.startIndex, offsetBy: index)*/
                /*let subString = String(newInput[initialIndex...tailIndex])*/
                /*if let newChar = dictionary[subString] {*/
                    /*let insertIndex = tempInput.index(tempInput.startIndex, offsetBy: (index*2)-1)*/
                    /*tempInput.insert(contentsOf: newChar, at: insertIndex)*/
                /*}*/
            /*}*/
            /*newInput = tempInput*/
        /*}*/
        /*[>print(newInput)<]*/
        /*calculatePart1(newInput: newInput)*/
    /*}*/

}
