//
//  _0210407_EricFord_NYCSchoolsApp.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/7/21.
//

import SwiftUI

@main
struct _0210407_EricFord_NYCSchoolsApp: App {
    var body: some Scene {
        WindowGroup {
            SchoolListView(viewModel: SchoolListViewModel())
            //ContentView()
        }
    }
}
