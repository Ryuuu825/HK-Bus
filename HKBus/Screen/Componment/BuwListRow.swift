//
//  BuwListRow.swift
//  HKBus
//
//  Created by Ryu on 5/6/2023.
//

import Foundation
import SwiftUI

struct BusListRow : View {
    
    var routeName  : String
    var routeDest  : String
    var routeStart : String
    var price      : Double
    var min        : Int
    
    var body: some View {
        HStack {
            Text(routeName)
                .bold()
                .font(.title2)
                .padding(.trailing, 20)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("往")
                    Text(routeDest)
                        .bold()
                        .font(.title2)
                }
                HStack {
                    Text(routeStart)
                        
                    Text("( $ \(price.formatted(.number)) )")
                }.foregroundColor(Color(UIColor.secondaryLabel))
                
            }
            
            Spacer()
            
            VStack {
                Text(min.formatted())
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(UIColor.systemBlue))
                
                Text("分鐘")
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical , 6)
    }
}
