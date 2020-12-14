//
//  UnderlineSolution.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/14.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct UnderlineSolution: View {
    var body: some View {
        VStack(spacing:30){
            Text("标准下划线")
                .underline()
            Text("标准下划线设置颜色")
                .underline(true, color: .red)
            Text("标准下划线隐藏")
                .underline(false)
            //StrokeStyle设置为虚线
            //alignments设置为在原先view的下面
            //offset定义间距
            Text("自定义样式")
                .overlay(
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(height: 1)
                        .offset(y: 4)
                        .foregroundColor(.blue)
                    , alignment: .bottom)
        }
    }
}

struct UnderlineSolution_Previews: PreviewProvider {
    static var previews: some View {
        UnderlineSolution()
    }
}
