import UIKit


var moves: [String] = Array(repeating: "", count: 9)

private func checkPanels(_ panels: [String], player: String) -> Bool {
    // 横
        let yoko1 = 0
        let yoko2 = 3
        let yoko3 = 6
    
    // +1,+2をfor文を使ってまとめる
    
    for number in 0...2 {
        let aaa = panels[yoko1 + number]
        let bbb = panels[yoko2 + number]
        let ccc = panels[yoko3 + number]
        if aaa == player {
            return true
        } else if bbb == player {
            return true
        } else if ccc == player {
            return true
        }
        return false
    }
    
    
    //    if panels[yoko1] == player && panels[yoko1 + 1] == player && panels[yoko1 + 2] == player {
    //        return true
    //    } else if panels[yoko2] == player && panels[yoko2 + 1] == player && panels[yoko2 + 2] == player {
    //        return true
    //    } else if panels[yoko3] == player && panels[yoko3 + 1] == player && panels[yoko3 + 2] == player {
    //        return true
    
    //    }
    
    
    
    // 縦
    let tate0 = 0
    let tate1 = 1
    let tate2 = 2
    if panels[tate0] == player && panels[tate0 + 3] == player && panels[tate0 + 6] == player {
        return true
    } else if panels[tate1] == player && panels[tate1 + 3] == player && panels[tate1 + 6] == player {
        return true
    } else if panels[tate2] == player && panels[tate2 + 3] == player && panels[tate2 + 6] == player {
        return true
    }
    
    // 斜め
    if panels[0] == player && panels[4] == player && panels[8] == player {
        return true
    } else if panels[2] == player && panels[4] == player && panels[6] == player {
        return true
    }
    return false
}

//moves[0] = "🐶"
//moves[4] = "🐶"
//moves[8] = "🐶"
//print(moves)
//
//moves[2] = "🐱"
//moves[3] = "🐱"
//moves[5] = "🐱"
//print(moves)

let ccc = checkPanels(moves, player: "🐶")
//let ddd = checkPanels(moves, player: "🐱")
//let eee = checkPanels(moves, player: "🐶")
//let fff = checkPanels(moves, player: "🐱")

// 1.2.3を一つの変数にまとめるためにfor stride
// まとめた変数をfor文で出力

for num in 0...2 {
    print("num:\(num)")
}

for index in 0...2 {
    print("index:\(moves[index])")
}


let aaa1 = 1
let aaa2 = 2
let aaa3 = 3

for mike in 0...2 {
    print("mike:\(moves[aaa1 + mike])")
    print("mike2:\(moves[aaa2 + mike])")
    print("mike3:\(moves[aaa3 + mike])")
}

moves[0] = "あ"
moves[1] = "い"
moves[2] = "う"
