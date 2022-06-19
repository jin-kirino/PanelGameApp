import UIKit


var moves: [String] = Array(repeating: "", count: 9)

private func checkPanel(_ panels: [String], player: String) -> Bool {
    // 横
    if panels[0] == player && panels[1] == player && panels[2] == player {
        return true
    } else if panels[0] == player && panels[1] == player && panels[2] == player {
        return true
    } else if panels[3] == player && panels[4] == player && panels[5] == player {
        return true
    } else if panels[6] == player && panels[7] == player && panels[8] == player {
        return true
    // 縦
    } else if panels[0] == player && panels[3] == player && panels[6] == player {
        return true
    } else if panels[1] == player && panels[4] == player && panels[7] == player {
        return true
    } else if panels[2] == player && panels[5] == player && panels[8] == player {
        return true
    // 斜め
    } else if panels[0] == player && panels[4] == player && panels[8] == player {
        return true
    } else if panels[2] == player && panels[4] == player && panels[6] == player {
        return true
    }
    return false
}

moves[0] = "🐶"
moves[4] = "🐶"
moves[8] = "🐶"
print(moves)

moves[2] = "🐱"
moves[3] = "🐱"
moves[5] = "🐱"
print(moves)

let ccc = checkPanel(moves, player: "🐶")
let ddd = checkPanel(moves, player: "🐱")
