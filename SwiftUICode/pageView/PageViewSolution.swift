//
//  PageViewSolution.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/14.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI

struct PageViewSolution: View {
    @State var leftPercent:CGFloat// = 0
    let maxWidth = UIScreen.main.bounds.width
    var body: some View {
        GeometryReader{geometry in
            HScrollViewController(pageWidth: self.maxWidth, contentSize: CGSize(width: self.maxWidth*2, height: geometry.size.height),leftPercent:self.$leftPercent) {
                HStack(spacing:0){
                    PageContentView(color1: .red, color2: .green)
                        .frame(maxWidth:.infinity)
                    PageContentView(color1: .blue, color2: .pink)
                        .frame(maxWidth:.infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red,lineWidth: 1)
                        )
                }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black,lineWidth: 1)
                )
            }
        }
    }
}

fileprivate struct PageContentView : View {
    let color1 : Color
    let color2 : Color
    var body: some View {
        ScrollView{
            VStack {
                ForEach(0..<30){index in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 200)
                        .foregroundColor(index%2==0 ? self.color1 : self.color2)
                }
            }
        }
    }
}


struct PageViewSolution_Previews: PreviewProvider {
    static var previews: some View {
        PageViewSolution(leftPercent: 0)
    }
}
