//
//  ContentView.swift
//  PanelGame.swift
//
//  Created by 神　樹里乃 on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    @State private var columns: [GridItem] = Array(repeating: .init(.fixed(120)), count: 3)
    var body: some View {
        ZStack {
            // 画面いっぱい真っ黒
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("パネルゲーム")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    // 左上寄せ
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 130)
                ScrollView(.vertical) {
                    // 幅が指定通りで高さがView要素に応じて広がる
                    // (colums: [GridItem]配列を渡す, alignment: 行の配置を.center .top .bottom で指定, spacing: 行の間隔,
                    LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                        // 分かりやすいようにナンバリング
                        ForEach((0...8), id: \.self) { number in
                            ZStack {
                                // 円の半径
                                RoundedRectangle(cornerRadius: 10)
                                    // 塗りつぶしの色
                                    .fill(Color.white)
                                    // フレームのサイズ指定
                                    .frame(width: 115, height: 115)
                                Text("\(number)")
                            }// ZStack
                        }// ForEach
                    }// LazyVGrid
                }// ScrollView
            }// VStack
        }// ZStack
    }// body
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
