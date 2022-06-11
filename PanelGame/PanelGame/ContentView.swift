//
//  ContentView.swift
//  PanelGame
//
//  Created by 神　樹里乃 on 2022/06/09.
//

import SwiftUI

struct ContentView: View {
    // .flexible グリッドのサイズを可変長
    @State private var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 120, maximum: 130)), count: 3)

    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            // 黒を指定
            appearance.backgroundColor = UIColor.black
            // 文字色　白
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
                        ForEach((0...8), id: \.self) { number in
                            ZStack {
                                // 円の半径
                                RoundedRectangle(cornerRadius: 10)
                                // 塗りつぶしの色
                                    .fill(Color.white)
                                // フレームのサイズ指定
                                    .frame(width: 115, height: 115)
                                // 分かりやすいようにナンバリング
                                Text("\(number)")
                                    .foregroundColor(.blue)
                            }// ZStack
                        }// ForEach
                    }// LazyVGrid
                    // LazyVGridの周りを
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
