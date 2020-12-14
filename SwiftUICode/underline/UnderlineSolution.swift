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
            
            //直接绘制虚线
            Path{ path in
                path.move(to: CGPoint(x: 20, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 300))
            }
            .stroke(style: StrokeStyle( lineWidth: 10, dash: [5]))
            .foregroundColor(Color(UIColor.blue))
        }
    }
}

struct UnderlineSolution_Previews: PreviewProvider {
    static var previews: some View {
        UnderlineSolution()
    }
}
