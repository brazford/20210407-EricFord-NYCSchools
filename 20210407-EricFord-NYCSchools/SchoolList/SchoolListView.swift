//
//  SchoolListView.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/7/21.
//

import SwiftUI

struct SchoolListView: View {
    @ObservedObject var viewModel: SchoolListViewModel

    init(viewModel: SchoolListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            Group {
                if viewModel.schoolViewModels.count == 0 {
                    ProgressView()
                    .scaleEffect(x: 10, y: 10, anchor: .center)
                }
                else {
                    List(viewModel.schoolViewModels, id: \.school.schoolName) { item in
                        NavigationLink(destination: SchoolDetailsView(viewModel: item)) {
                            VStack(alignment: .leading) {
                                Text(item.school.schoolName)
                                    .font(.headline)
                                Text(item.address)
                            }
                        }
                    }
                    .navigationTitle("NYC Schools")
                }
            }.onAppear(perform: viewModel.loadData)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SchoolListView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListView(viewModel: SchoolListViewModel())
    }
}
