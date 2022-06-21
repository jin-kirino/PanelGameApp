//
//  ContentView.swift
//  PanelGame
//
//  Created by 神　樹里乃 on 2022/06/09.
//

import SwiftUI

struct ContentView: View {
    // .flexible グリッドのサイズを可変長(minimum: 最低120, maximum: 最高130)どんだけデバイスが変わってもこのルールは守る
    @State private var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 120, maximum: 130)), count: 3)
    // 9個のパネルを配列で管理する
    @State private var moves: [String] = Array(repeating: "", count: 9)
    // firstPlayerだったらtrue、secondPlayerだったらfalse
    @State private var firstPlayer: Bool = true
    // アラートの表示を管理する
    @State private var showingAlert: Bool = false

    init() {
        // UINavigationBarAppearanceを使ってnavigationTitleをカスタマイズ
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        // 背景に黒を指定
        appearance.backgroundColor = .black
        // 文字色に白を指定
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    // 勝利条件が確定したら、Alertメッセージとゲーム終了をセットする
    // 入力パラメータ：パネルを管理する配列
    private func setWinner(_ panels: [String]) -> String {
        // 戻り値（アラートのmessageに表示する文字）
        var dialog: String = ""
        // プレイヤーが"🐶"の場合に勝利が確定しているのかチェック
        if checkPanels(moves, player: "🐶") == true {
            // 勝利が確定しているのでAlertのメッセージをセット
            dialog = "プレイヤー🐶の勝利!!!"
            // ゲームが終了しているのでゲーム終了をセット→アラートを表示
            showingAlert.toggle()
            // プレイヤーが"😸"の場合に勝利が確定しているのかチェック
        } else if checkPanels(moves, player: "🐱") == true {
            // 勝利が確定しているのでAlertのメッセージをセット
            dialog = "勝者\nプレイヤー🐱の勝利!!!"
            // ゲームが終了しているのでゲーム終了をセット→アラートを表示
            showingAlert.toggle()
            // どのプレイヤーも勝利が確定していないとき
        } else {
            // すべてのパネルが選択されているのか？を確認したい
            // containsでパネル（配列）の値に空（""）があるのかを確認する。
            // 空のパネルがあったらゲーム続行
            if moves.contains("") == true {
            } else {
                // すべてのパネルが選択済みなら
                // 引き分けのメッセージをセット
                dialog = "引き分け!!!"
                // ゲームが終了しているのゲーム終了をセット→アラートを表示
                showingAlert.toggle()
            }
        }
        // Alertのメッセージを返却
        return dialog
    }// setWinner

    // 勝利条件が確定しているのかチェックする
    // 入力パラメータ：パネルを管理する配列、チェックするプレイヤー（🐶or😸）
    private func checkPanels(_ panels: [String], player: String) -> Bool {
        // 横
        let yoko1 = 0
        let yoko2 = 3
        let yoko3 = 6
        let tate0 = 0
        let tate1 = 1
        let tate2 = 2

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
        for mike in 0...2 {
            let aaa = moves[yoko1 + mike]
            print("aaa:\(aaa)")
//            let bbb = moves[yoko2 + mike]
//            print("bbb:\(bbb)")
//            let ccc = moves[yoko3 + mike]
//            print("ccc:\(ccc)")
            if aaa == player {
                return true
//            } else if bbb == player {
//                return true
//            } else if ccc == player {
//                return true
            }
            return false
        }
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

//        if panels[yoko1] == player && panels[yoko1 + 1] == player && panels[yoko1 + 2] == player {
//                return true
//        } else if panels[yoko2] == player && panels[yoko2 + 1] == player && panels[yoko2 + 2] == player {
//                return true
//        } else if panels[yoko3] == player && panels[yoko3 + 1] == player && panels[yoko3 + 2] == player {
//                return true
//        } else
        // 縦
        if panels[tate0] == player && panels[tate0 + 3] == player && panels[tate0 + 6] == player {
            return true
        } else if panels[tate1] == player && panels[tate1 + 3] == player && panels[tate1 + 6] == player {
            return true
        } else if panels[tate2] == player && panels[tate2 + 3] == player && panels[tate2 + 6] == player {
            return true
        // 斜め
        } else if panels[0] == player && panels[4] == player && panels[8] == player {
            return true
        } else if panels[2] == player && panels[4] == player && panels[6] == player {
            return true
        }
        return false
    }// checkPanels

    var body: some View {
        NavigationView {
            ZStack {
                // 画面いっぱい真っ黒
                Color.black
                    .ignoresSafeArea()
                // 幅が指定通りで高さがView要素に応じて広がる
                // (colums: [GridItem]配列を渡す, alignment: 行の配置を.center .top .bottom で指定, spacing: 行の間隔)
                LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                    ForEach((0..<moves.count), id: \.self) { number in
                        ZStack {
                            // 円の半径
                            RoundedRectangle(cornerRadius: 10)
                            // 塗りつぶしの色
                                .fill(Color.white)
                            // フレームのサイズ指定
                                .frame(width: 115, height: 115)
                            // パネル１個１個
                            Text(moves[number])
                            // パネル全体
                            Spacer()
                        }// ZStack
                        // タップされた時
                        .onTapGesture {
                            // 空欄のパネルがタップされたら
                            if moves[number] == "" {
                                // 🐶と🐱をチェンジ
                                firstPlayer.toggle()
                                if firstPlayer == true {
                                    // パネルに🐶を追加
                                    moves[number] = "🐶"
                                } else {
                                    // パネルに🐱を追加
                                    moves[number] = "🐱"
                                }
                                print("タップ")
                                // ここでアラートを表示できればいい「！戻り値を使う！」
                                _ = setWinner(_: moves)
                            }// if else
                        }// onTapGesture
                    }// ForEach
                }// LazyVGrid
                // LazyVGridの周り空白を可変長で指定
                .padding()
            }// ZStack
            .navigationBarTitle("パネルゲーム")
        }// NavigationView
        .alert("勝者", isPresented: $showingAlert) {
            // リトライボタンを押したら新しいゲームが表示される
            Button("もう一度！") {
                moves = [""]
            }
        } message: {
            // これにちゃんと入力して、どっちが勝ったかを表示させるor引き分け
            Text(setWinner(_:moves))
        }// alert
    }// body
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// タップされた時に揃っているか確認する
// ２個目は勝利しているかをチェックする
// 戻り値を使う

// アラートを表示して「もう一度！」をタップしたら初期画面
// タップした時にパネルの背景をオレンジに変更
//
