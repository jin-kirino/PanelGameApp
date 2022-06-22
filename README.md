# PanelGame_kirino
配列を活用したパネルゲーム

◉全体の動き
// @State private var ShowAlert: Bool = false

// 犬が勝ってるかチェック→「◯の勝利！」の部分に犬入れる
// 猫が勝ってるかチェック→「◯の勝利！」の部分に猫入れる
// まだ勝利が確定してない→全部のパネルが選択されてるか？== 配列の値に空（””）があるのか確認
// A:まだ全部選択されていない（=まだ空の値（””）がある）→ゲーム継続
// B:もう全部選択された(=空の値（””）はない）→引き分けのメッセージをセットしてゲーム終了

// 勝利条件が満たされていたらtrue、まだ決着がついていなかったらfalse
// 横(012,345,678)に揃っているか確認→ダイアログ表示
// 縦(036,147,258)に揃っているか確認→ダイアログ表示
// 斜め(048,246)に揃っているか確認→ダイアログ表示
// 全パネルが選択されても揃わなかった確認→ダイアログ表示

// 勝利条件が確定したら、Alertメッセージとゲーム終了をセットする → 確定してたら「◯の勝利！」してなかったら「引き分け」をアラートのTextに返す
// →アラートのダイアログにこの配列の引数を入力してアラートメッセージ（ダイアログ）を表示させる
// ↑入力パラメータ：パネルを管理する配列

◉checkPanelsのボツ集

Part1
// 横方向で揃っていないかをチェック
// for strideを使ってパネルを3つずつチェックすることで、1行ずつチェックできる
// その行の左から1列目、2列目、3列目が同じプレイヤーで揃っているかをチェック
// 0,1,2
// for _ in stride(from: 0, through: 2, by: 1) {
// }
// 3,4,5
// for _ in stride(from: 3, through: 5, by: 1) {
// }
// 6,7,8
// for _ in stride(from: 6, through: 8, by: 1) {
// }
// 横方向に3つ揃っているので、勝利条件が確定（true）

// 縦方向で揃っていないかをチェック
// パネルの0,1,2番目でループすると、縦方向のチェックができる
// その列の1行目、2行目、3行目が同じプレイヤーで揃っているかをチェック
// 0,3,6
// for _ in stride(from: 0, through: 8, by: 3) {
// }
// 1,4,7
// for _ in stride(from: 1, through: 8, by: 3) {
// }
// 2,5,8
// for _ in stride(from: 2, through: 8, by: 3) {
// }
// 縦方向に3つ揃っているので、勝利条件が確定（true）

// 左から右下斜めに同じプレイヤーで3つ揃っているのかをチェック
// 0,4,8
// for _ in stride(from: 0, through: 8, by: 4) {
// }
// 揃っているので勝利条件が確定（true）

// 右から左下斜めに同じプレイヤーで3つ揃っているのかをチェック
// 2,4,6
// for _ in stride(from: 2, through: 8, by: 2) {
// }
// 揃っているので勝利条件が確定（true）

// 3つ揃っていない場合は勝利条件が不確定（false）
// 勝利条件を管理するBool値を返却
// return false


// 横
//        let yoko1 = 0
//        let yoko2 = 3
//        let yoko3 = 6
//        let tate0 = 0
//        let tate1 = 1
//        let tate2 = 2

//        if panels[yoko1] == player && panels[yoko1 + 1] == player && panels[yoko1 + 2] == player {
//                return true
//        } else if panels[yoko2] == player && panels[yoko2 + 1] == player && panels[yoko2 + 2] == player {
//                return true
//        } else if panels[yoko3] == player && panels[yoko3 + 1] == player && panels[yoko3 + 2] == player {
//                return true
//        } else

Part2
//        // 0,1,2
//        for number in 0...2 {
//            print("number1:\(number)")
//            if panels[yoko1 + number] == player {
//                print("1:\(panels[yoko1 + number])")
//                return true
//            }
//        }// for in
//        // 3,4,5
//        for number in 0...2 {
//            if panels[yoko2 + number] == player {
//                print("2:\(panels[yoko2 + number])")
//                return true
//            }
//        }// for in
//        // 6,7,8
//        for number in 0...2 {
//            if panels[yoko3 + number] == player {
//                print("3:\(panels[yoko3 + number])")
//                return true
//            }
//            return false
//        }// for in

Part3
//        for number in 0...2 {
//            let aaa = panels[yoko1 + number]
//            let bbb = panels[yoko2 + number]
//            let ccc = panels[yoko3 + number]
//            if aaa == player {
//                return true
//            } else if bbb == player {
//                return true
//            } else if ccc == player {
//                return true
//            }
//            return false
//        }
//        for mike in 0...2 {
//            let aaa = moves[yoko1 + mike]
//            print("aaa:\(aaa)")
//            let bbb = moves[yoko2 + mike]
//            print("bbb:\(bbb)")
//            let ccc = moves[yoko3 + mike]
//            print("ccc:\(ccc)")
//            if aaa == player {
//                return true
//            } else if bbb == player {
//                return true
//            } else if ccc == player {
//                return true
//            }
//            return false
//        }
//        for mike2 in 0...2 {
//            let bbb = moves[yoko2 + mike2]
//            print("bbb:\(bbb)")
//            if bbb == player {
//                return true
//            }
//        }
//        for mike3 in 0...2 {
//            let ccc = moves[yoko3 + mike3]
//            print("ccc:\(ccc)")
//            if ccc == player {
//                return true
//            }
//        }

Part4
//        for number in 0...2 {
//            if panels[yoko1 + number] == player && panels[yoko1 + number] == player && panels[yoko1 + number] == player {
//                return true
//            } else if panels[yoko2 + number] == player && panels[yoko2 + number] == player && panels[yoko2 + number] == player {
//                return true
//            } else if panels[yoko3 + number] == player && panels[yoko3 + number] == player && panels[yoko3 + number] == player {
//                return true
//            } else {
//                return false
//            }
//        }

