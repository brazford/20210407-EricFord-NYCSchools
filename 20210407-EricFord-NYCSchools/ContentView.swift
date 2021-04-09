//
//  ContentView.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SchoolListView(viewModel: SchoolListViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
