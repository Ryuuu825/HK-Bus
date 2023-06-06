//
//  ETAView.swift
//  HKBus
//
//  Created by Ryu on 6/6/2023.
//

import SwiftUI
import MapKit

struct ETAView: View {
    
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var selectedIndex = -1
    
    @State private var offsetY : CGFloat = 0
    
    
    var body: some View {
        
            
        VStack {
            
            
            Map(coordinateRegion: $region, interactionModes: [.pan])
                .frame(width: 400, height: offsetY < 0 ? max(150 , ( 300 - -offsetY / 2 )) : 250)
                .cornerRadius(12)

            ScrollView {
               
                GeometryReader { proxy in
                    let _ = offsetY = proxy.frame(in: .named("scrollViewETA")).minY
                    Color.clear
                }
                
                VStack {

                    ForEach(1..<12) { id in
                        Button { selectedIndex = id } label: {
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading, spacing: 5) {
                                    HStack {
                                        Text(id.formatted())
                                            .frame(width: 23, alignment: .leading)
                                            .fontWeight(.light)
                                        Text("竹園邨總站")
                                    }
                                    .bold()
                                    .font(.title3)
                                    
                                    HStack {
                                        Text("車資:")
                                        Text("$6.2 ")
                                    }
                                    .fontWeight(.regular)
                                    .font(.subheadline)
                                   
                                    
                                }.padding(.horizontal)
                                
                                if selectedIndex == id {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 8 ) {
                                            HStack {
                                                Text("6")
                                                    .bold()
                                                    .padding(.horizontal , 12)
                                                    .frame(width: 50, alignment: .trailing)
                                                    .foregroundColor(.cyan)
                                                    .font(.title2)
                                                
                                                Text("分鐘")
                                                Text(" - 原定班次")
                                                    
                                            }
                                            
                                            HStack {
                                                Text("20")
                                                    .bold()
                                                    .padding(.horizontal , 12)
                                                    .frame(width: 50, alignment: .trailing)
                                                
                                                Text("分鐘")
                                                Text(" - 原定班次")
                                                    
                                            }
                                            
                                            HStack {
                                                Text("39")
                                                    .bold()
                                                    .padding(.horizontal , 12)
                                                    .frame(width: 50, alignment: .trailing)
                                                Text("分鐘")
                                                Text(" - 原定班次")
                                                    
                                            }
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(UIColor.secondarySystemBackground).ignoresSafeArea())
                                }
                                
                            }
                            .foregroundColor(Color(UIColor.label))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical , 6)
                        }
                        
                      
                        Divider()
                            
                        
                        
                    }
                }
            }
            .coordinateSpace(name: "scrollViewETA")
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
            .padding(.vertical)
        }
            
            
       
        
    }
}

struct ETAView_Previews: PreviewProvider {
    static var previews: some View {
        ETAView()
    }
}
