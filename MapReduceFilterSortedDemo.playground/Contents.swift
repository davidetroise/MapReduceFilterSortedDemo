import SwiftUI

let text  = """
tennis 23.78 10.97
soccer 110 75
basketball 25 15
"""

struct Sport {
    let name: String
    let pitchArea: Double
}

let lines = text.components(separatedBy: CharacterSet.newlines)
let words = lines.map{ $0.components(separatedBy: CharacterSet.whitespaces) }
words

let sports = words.map{
    let name = $0[0]
    let width = Double($0[1]) ?? 0
    let height = Double($0[2]) ?? 0
    return Sport(name: name, pitchArea: width * height)
}

let filtered = sports.filter{ $0.pitchArea < 1000 }
filtered

let totalArea = filtered.reduce(0) { partialResult, sport in
    partialResult + sport.pitchArea
}

let sorted = sports.sorted{ $0.pitchArea > $1.pitchArea }
sorted
