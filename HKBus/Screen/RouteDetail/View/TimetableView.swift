//
//  TimetableView.swift
//  HKBus
//
//  Created by Ryu on 6/6/2023.
//

import SwiftUI

struct TimetableView: View {
    var body: some View {
        VStack {
            
            ScrollView {
                GeometryReader { proxy in
                    VStack {
                        VStack(alignment: .leading ) {
                            Text("星期一至五")
                            
                            ForEach(1..<12) { _ in
                                HStack {
                                    Text("0530 - 0900 ")
                                        .frame(width: proxy.size.width * 0.5 , alignment: .leading)
                                    
                                    Text("15-20 mins")
                                        .bold()
                                        .frame(width: proxy.size.width * 0.5, alignment: .leading)
                                }
                                .padding(.vertical , 1)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct TimetableView_Previews: PreviewProvider {
    static var previews: some View {
        TimetableView()
    }
}
