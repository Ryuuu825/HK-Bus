//
//  RouteDetailPage.swift
//  HKBus
//
//  Created by Ryu on 5/6/2023.
//

import SwiftUI
import MapKit

enum Tab : String , View, CaseIterable, Identifiable {
    
    case ETA = "到站時間", TravelTime = "車程", Timetable = "時間表"
    
    @ViewBuilder var body : some View {
        switch self {
            case .ETA: ETAView()
            case .TravelTime : TravelTimeView()
            case .Timetable : TimetableView()
            
        }
    }
    
    @ViewBuilder var tabBarItem : some View {
        Text(self.rawValue)
    }
    
    var id : Self { self }

}

struct RouteDetailPage: View {
    
    var routeNumber: String
    
    @State var tab : Tab = .ETA
    
  
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {} label: {
                        Image(systemName: "arrow.2.circlepath")
                            .foregroundColor(Color(uiColor: .label))
                    }
                    
                    Spacer()
                    
                    VStack {
                        
                        Text(routeNumber)
                            .bold()
                            .font(.title2)
                        
                        HStack {
                            Text("往 ")
                            
                            Text("尖沙咀碼頭")
                        }
                        .font(.body)
                    }
                    
                    Spacer()
                    
                    
                    Button {} label: {
                        Image(systemName: "timer")
                            .foregroundColor(Color(uiColor: .label))
                    }
                }
                .font(.body)
                .padding(.horizontal)
                
                Picker( selection: $tab ) {
                    ForEach(Tab.allCases) { $0.tabBarItem }
                } label: {}
                .pickerStyle(.segmented)
                .padding()

               
                VStack {
                    tab
                }
                
                
                
                Spacer()
            }
            .padding(.vertical , 1)
            .preferredColorScheme(.dark)
            .background()
            .navigationTitle("")
            
        }.padding(.vertical , 1)
        
    }
}

struct RouteDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RouteDetailPage(
                routeNumber: "1"
            ).environment(\.colorScheme, .dark)
        }
    }
}
