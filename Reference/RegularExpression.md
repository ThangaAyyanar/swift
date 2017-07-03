# Regular Expression



Even if the matchesInString() method takes a String as the first argument, it works internally with NSString, and the range parameter must be given using the NSString length and not as the Swift string length. Otherwise it will fail for "extended grapheme clusters" such as "flags".

## As of Swift 4 (Xcode 9, currently in beta), the Swift standard library provides functions to convert between Range<String.Index> and NSRange.

            func matches(for regex: String, in text: String) -> [String] {

                do {
                    let regex = try NSRegularExpression(pattern: regex)
                    let results = regex.matches(in: text,
                                                range: NSRange(text.startIndex..., in: text))
                    return results.map {
                        text.substring(with: Range($0.range, in: text)!)
                    }
                } catch let error {
                    print("invalid regex: \(error.localizedDescription)")
                    return []
                }
            }

            Example:

            let string = "🇩🇪€4€9"
            let matched = matches(for: "[0-9]", in: string)
            print(matched)
            // ["4", "9"]

(Older answer for Swift 3 and earlier:)

So you should convert the given Swift string to an NSString and then extract the ranges. The result will be converted to a Swift string array automatically.

(The code for Swift 1.2 can be found in the edit history.)

## Swift 2 (Xcode 7.3.1) :

            func matchesForRegexInText(regex: String, text: String) -> [String] {

                do {
                    let regex = try NSRegularExpression(pattern: regex, options: [])
                    let nsString = text as NSString
                    let results = regex.matchesInString(text,
                                                        options: [], range: NSMakeRange(0, nsString.length))
                    return results.map { nsString.substringWithRange($0.range)}
                } catch let error as NSError {
                    print("invalid regex: \(error.localizedDescription)")
                    return []
                }
            }

            Example:

            let string = "🇩🇪€4€9"
            let matches = matchesForRegexInText("[0-9]", text: string)
            print(matches)
            // ["4", "9"]

## Swift 3 (Xcode 8)

            func matches(for regex: String, in text: String) -> [String] {

                do {
                    let regex = try NSRegularExpression(pattern: regex)
                    let nsString = text as NSString
                    let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
                    return results.map { nsString.substring(with: $0.range)}
                } catch let error {
                    print("invalid regex: \(error.localizedDescription)")
                    return []
                }
            }

            Example:

            let string = "🇩🇪€4€9"
            let matched = matches(for: "[0-9]", in: string)
            print(matched)
            // ["4", "9"]

