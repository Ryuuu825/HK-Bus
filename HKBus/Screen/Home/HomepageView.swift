//
//  HomepageView.swift
//  HKBus
//
//  Created by Ryu on 5/6/2023.
//

import SwiftUI

struct HomepageView: View {
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("HK Bus")
                    .bold()
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground).ignoresSafeArea())
                
                
                Picker(selection: .constant(true)) {
                    Text("附近")
                    Text("常用")
                    Text("收藏")
                } label: {
                    Text("sdf")
                }
                .pickerStyle(.segmented)
                .padding()

                
                ScrollView {
                    ForEach(1..<12) { _ in
                        BusListRow(routeName: "249X", routeDest: "博康", routeStart: "長青邨青槐樓", price: 9.6, min: 19)
                        
                        Divider()
                    }
                }
            }
            
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
            .environment(\.colorScheme, .dark)
            .environment(\.locale, .init(identifier: "zh"))
           
    }
}
