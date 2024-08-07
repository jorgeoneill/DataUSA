//
//  ContentView.swift
//  DataUSA
//
//  Created by Jorge O'Neill on 03/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MainView(viewModel: MainView.ViewModel())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
