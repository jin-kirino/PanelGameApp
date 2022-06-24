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
    // アラートのメッセージを管理する
    @State private var alertMessage: String = ""

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
        // 戻り値の変数を設定
        var check: Bool = false
        // 横
        for number in stride(from: 0, through: 8, by: 3) {
            if panels[number] == player && panels[number + 1] == player && panels[number + 2] == player {
                check = true
            }
        }
        // 縦
        for number in 0...2 {
            if panels[number] == player && panels[number + 3] == player && panels[number + 6] == player {
                check = true
            }
        }
        // 斜め
        if panels[0] == player && panels[4] == player && panels[8] == player {
            check = true
        } else if panels[2] == player && panels[4] == player && panels[6] == player {
            check = true
        }
        return check
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
                            // 塗りつぶしの色 三項演算子　値　？　trueの時　：　falseの時
                                .fill(moves[number] == "" ? Color.white : Color.orange)
                            // フレームのサイズ指定
                                .frame(width: 115, height: 115)
                            // パネル１個１個
                            Text(moves[number])
                                // 文字の大きさ指定
                                .font(.largeTitle)
                            // パネル全体
                            Spacer()
                        }// ZStack
                        // タップされた時
                        .onTapGesture {
                            // 空欄のパネルがタップされたら
                            if moves[number] == "" {
                                if firstPlayer == true {
                                        // パネルに🐶を追加
                                        moves[number] = "🐶"
                                } else {
                                    // パネルに🐱を追加
                                    moves[number] = "🐱"
                                }
                                // 🐶と🐱をチェンジ
                                firstPlayer.toggle()
                                print("タップ")
                                // ここでアラートを表示できればいい「！戻り値を使う！」
                                alertMessage = setWinner(_: moves)
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
                moves = Array(repeating: "", count: 9)
            }
        } message: {
            // これにちゃんと入力して、どっちが勝ったかを表示させるor引き分け
            Text(alertMessage)
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
