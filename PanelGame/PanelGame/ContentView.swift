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
                            if moves[number] == "" {
                                firstPlayer.toggle()
                                if firstPlayer == true {
                                    moves[number] = "🐶"
                                } else {
                                    moves[number] = "🐱"
                                }
                                print("タップされてる")
                            }// if else
                        }// onTapGesture
                    }// ForEach
                }// LazyVGrid
                // LazyVGridの周り空白を可変長で指定
                .padding()
            }// ZStack
            .navigationBarTitle("パネルゲーム")
        }// NavigationView
    }// body
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// @State private var ShowAlert: Bool = false

// 犬が勝ってるかチェック→「◯の勝利！」の部分に犬入れる
// 猫が勝ってるかチェック→「◯の勝利！」の部分に猫入れる
// まだ勝利が確定してない→全部のパネルが選択されてるか？== 配列の値に空（””）があるのか確認
// A:まだ全部選択されていない（=まだ空の値（””）がある）→ゲーム継続
// B:もう全部選択された(=空の値（””）はない）→引き分けのメッセージをセットしてゲーム終了

// 勝利条件が満たされていたらtrue、まだ決着がついていなかったらfalse
// 縦(036,147,258)に揃っているか確認→ダイアログ表示
// 横(012,345,678)に揃っているか確認→ダイアログ表示
// 斜め(048,246)に揃っているか確認→ダイアログ表示
// 全パネルが選択されても揃わなかった確認→ダイアログ表示

// 勝利条件が確定したら、Alertメッセージとゲーム終了をセットする → 確定してたら「◯の勝利！」してなかったら「引き分け」をアラートのTextに返す
// →アラートのダイアログにこの配列の引数を入力してアラートメッセージ（ダイアログ）を表示させる
// ↑入力パラメータ：パネルを管理する配列
