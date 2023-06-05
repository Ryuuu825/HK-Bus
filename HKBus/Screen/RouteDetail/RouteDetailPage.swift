//
//  RouteDetailPage.swift
//  HKBus
//
//  Created by Ryu on 5/6/2023.
//

import SwiftUI
import MapKit

struct RouteDetailPage: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var selectedIndex = -1
    @State private var offsetY : CGFloat = 540
    
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
                        
                        Text("1")
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
                
                Picker(selection: .constant(true)) {
                    Text("到站時間")
                    Text("車程")
                    Text("時間表")
                    
                } label: {
                    
                }
                .pickerStyle(.segmented)
                .padding()

                
                Map(coordinateRegion: $region, interactionModes: [.pan])
                    .frame(width: 400, height: offsetY < 480 ? max(100 , (offsetY / 2)) : 300)
                    
                
               
                
                ScrollView {
                   
                    
                    GeometryReader { proxy in
                        let _ = offsetY = proxy.frame(in: .global).minY
                        Color.clear
                    }
                    VStack {
                        
                       
                           
                       
                        ForEach(1..<12) { id in
                            Button { selectedIndex = id } label: {
                                VStack(alignment: .leading) {
                                    VStack {
                                        HStack {
                                            Text(id.formatted())
                                            Text("竹園邨總站")
                                        }
                                        .bold()
                                        .font(.title3)
                                        
                                        HStack {
                                            Text("車資:")
                                            Text("$6.2 ")
                                        }
                                    }.padding(.horizontal)
                                    
                                    if selectedIndex == id {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                HStack {
                                                    Text("6")
                                                        .bold()
                                                        .padding(.horizontal , 12)
                                                        .frame(width: 50, alignment: .trailing)
                                                        .foregroundColor(.blue)
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
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
                .padding(.vertical)
                
                
                Spacer()
            }
            .preferredColorScheme(.dark)
            .background()
            .navigationTitle("")
        }
        
    }
}

struct RouteDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RouteDetailPage()
                .environment(\.colorScheme, .dark)
        }
    }
}
