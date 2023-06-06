//
//  TravelTimeView.swift
//  HKBus
//
//  Created by Ryu on 6/6/2023.
//

import SwiftUI


struct TravelTimeView: View {
    
    @State private var selectedIndex = 1
    
    @State private var startIndex = 1
    @State private var endIndex = -1
    
    
    @ViewBuilder func displayCircleIf(id : Int) -> some View {
        
        let color = startIndex == id ? Color.red : ( endIndex == id ? Color.cyan : Color.clear )
        
        Circle()
            .frame(width: 25)
            .foregroundColor( color )
        
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Text("12")
                    .bold()
                    .font(.title)
                Text("分鐘")
            }
            
            ScrollView {
            
                VStack {
                        
                    ForEach(1..<12) { id in
                        Button { selectedIndex = id } label: {
                            HStack(alignment: .top) {
                                
                              
                                displayCircleIf(id: id)
                                    .padding(.top , 12)
                                    
                            
                                
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
                                        subbody(id: id)
                                    }
                                    
                                }
                                .foregroundColor(Color(UIColor.label))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical , 6)
                            }
                            .padding( .horizontal , 16 )
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
    
    @ViewBuilder func subbody(id: Int) -> some View {
        HStack {
            HStack(spacing: 8 ) {
                Button {
                    startIndex = id
                } label: {
                    HStack {
                        Text("設為起點")
                            .padding( .horizontal )
                            .padding(.vertical , 6)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(.infinity)
                    }
                }
                
                Button {
                    endIndex = id
                } label: {
                    HStack {
                        Text("設為終點")
                            .padding( .horizontal )
                            .padding(.vertical , 6)
                            .background(Color.cyan)
                            .foregroundColor(Color.white)
                            .cornerRadius(.infinity)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
   
}

struct TravelTimeView_Previews: PreviewProvider {
    static var previews: some View {
        TravelTimeView()
    }
}
