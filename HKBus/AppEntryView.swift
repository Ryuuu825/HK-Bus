//
//  AppEntryView.swift
//  HKBus
//
//  Created by Ryu on 5/6/2023.
//

import SwiftUI

struct AppEntryView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppEntryView()
    }
}
