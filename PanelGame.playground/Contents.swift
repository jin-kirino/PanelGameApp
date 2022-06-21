import UIKit


var moves: [String] = Array(repeating: "", count: 9)

private func checkPanels(_ panels: [String], player: String) -> Bool {
    
    // +1,+2をfor文を使ってまとめる
    
    
//    for mike in 0...2 {
//        let aaa = moves[yoko1 + mike]
//        print("aaa:\(aaa)")
//        if aaa == player {
//            return true
//        }
//    }
//    for mike2 in 0...2 {
//        let bbb = moves[yoko2 + mike2]
//        print("bbb:\(bbb)")
//        if bbb == player {
//            return true
//        }
//    }
//    for mike3 in 0...2 {
//        let ccc = moves[yoko3 + mike3]
//        print("ccc:\(ccc)")
//        if ccc == player {
//            return true
//        }
//    }
//for number in 0...2 {
//    if panels[yoko1 + number] == player && panels[yoko1 + number] == player && panels[yoko1 + number] == player {
//        return true
//    } else if panels[yoko2 + number] == player && panels[yoko2 + number] == player && panels[yoko2 + number] == player {
//        return true
//    } else if panels[yoko3 + number] == player && panels[yoko3 + number] == player && panels[yoko3 + number] == player {
//        return true
//    } else {
//        return false
//    }
//}
    //    if panels[yoko1] == player && panels[yoko1 + 1] == player && panels[yoko1 + 2] == player {
    //        return true
    //    } else if panels[yoko2] == player && panels[yoko2 + 1] == player && panels[yoko2 + 2] == player {
    //        return true
    //    } else if panels[yoko3] == player && panels[yoko3 + 1] == player && panels[yoko3 + 2] == player {
    //        return true
    
    //    }
    // 横
//        let yoko1 = 0
//        let yoko2 = 3
//        let yoko3 = 6
    for number in stride(from: 0, through: 8, by: 3) {
        if panels[number] == player && panels[number + 1] == player && panels[number + 2] == player {
            return true
        } else {
            return false
        }
    }
    
    
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

moves[6] = "🐶"
moves[7] = "🐶"
moves[8] = "🐶"
//print(moves)

//moves[0] = "🐱"
//moves[1] = "🐱"
//moves[4] = "🐱"
print(moves)

let ccc = checkPanels(moves, player: "🐶")
let ddd = checkPanels(moves, player: "🐱")
//let eee = checkPanels(moves, player: "🐶")
//let fff = checkPanels(moves, player: "🐱")

// 1.2.3を一つの変数にまとめるためにfor stride
// まとめた変数をfor文で出力

//for num in 0...2 {
//    print("num:\(num)")
//}

let aaa1 = 0
let aaa2 = 3
let aaa3 = 6

print("--------------------")
moves[0] = "あ"
moves[1] = "い"
moves[2] = "う"
moves[3] = "え"
moves[4] = "お"
moves[5] = "か"
moves[6] = "き"
moves[7] = "く"
moves[8] = "け"

for mike in 0...2 {
    print("mike:\(moves[aaa1 + mike])")
}
for mike2 in 0...2 {
    print("mike2:\(moves[aaa2 + mike2])")
}
for mike3 in 0...2 {
    print("mike:3\(moves[aaa3 + mike3])")
}
