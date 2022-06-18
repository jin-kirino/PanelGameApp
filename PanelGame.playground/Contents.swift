import UIKit


var moves: [String] = Array(repeating: "", count: 9)

private func checkPanels(_ panels: [String], player: String) -> Bool {
    // 横方向で揃っていないかをチェック
    // for strideを使ってパネルを3つずつチェックすることで、1行ずつチェックできる
    // その行の左から1列目、2列目、3列目が同じプレイヤーで揃っているかをチェック
    // 0,1,2
    for one in stride(from: 0, through: 3, by: 1) {
        if panels[one] == "🐶" || panels[one] == "🐱" {
            print(panels[one])
            return true
        }
    }
    // 3,4,5
    for _ in stride(from: 3, through: 5, by: 1) {
        return true
    }
    // 6,7,8
    for _ in stride(from: 6, through: 8, by: 1) {
        return true
    }
    // 横方向に3つ揃っているので、勝利条件が確定（true）

    // 縦方向で揃っていないかをチェック
    // パネルの0,1,2番目でループすると、縦方向のチェックができる
    // その列の1行目、2行目、3行目が同じプレイヤーで揃っているかをチェック
    // 0,3,6
    for _ in stride(from: 0, through: 8, by: 3) {
        return true
    }
    // 1,4,7
    for _ in stride(from: 1, through: 8, by: 3) {
        return true
    }
    // 2,5,8
    for _ in stride(from: 2, through: 8, by: 3) {
        return true
    }
    // 縦方向に3つ揃っているので、勝利条件が確定（true）

    // 左から右下斜めに同じプレイヤーで3つ揃っているのかをチェック
    // 0,4,8
    for _ in stride(from: 0, through: 8, by: 4) {
        return true
    }
    // 揃っているので勝利条件が確定（true）

    // 右から左下斜めに同じプレイヤーで3つ揃っているのかをチェック
    // 2,4,6
    for _ in stride(from: 2, through: 8, by: 2) {
        return true
    }
    // 揃っているので勝利条件が確定（true）

    // 3つ揃っていない場合は勝利条件が不確定（false）
    // 勝利条件を管理するBool値を返却
    return false
}// checkPanels


private func checkPanel(_ panels: [String], player: String) -> Bool {
    // 横方向で揃っていないかをチェック
    // for strideを使ってパネルを3つずつチェックすることで、1行ずつチェックできる
    // その行の左から1列目、2列目、3列目が同じプレイヤーで揃っているかをチェック
    // 0,1,2
    if panels[0] == "🐶" && panels[1] == "🐶" && panels[2] == "🐶" {
        return true
    } else if panels[0] == "🐱" && panels[1] == "🐱" && panels[2] == "🐱" {
        return true
    } else if panels[0] == "🐶" && panels[4] == "🐶" && panels[8] == "🐶" {
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


let aaa = checkPanels(moves, player: "🐶")
let bbb = checkPanels(moves, player: "🐱")

let ccc = checkPanel(moves, player: "🐶")
let ddd = checkPanel(moves, player: "🐱")
