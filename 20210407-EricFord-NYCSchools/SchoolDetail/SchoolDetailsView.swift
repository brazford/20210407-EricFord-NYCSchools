//
//  SchoolDetailsView.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/8/21.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct SchoolDetailsView: View {
    @State var viewModel: SchoolDetailsViewModel

    var body: some View {
        let pointsOfInterest = [
            AnnotatedItem(name: viewModel.school.schoolName, coordinate: .init(latitude: viewModel.latitude, longitude: viewModel.longitude))
            ]
        VStack {
            Map(coordinateRegion: viewModel.$region, annotationItems: pointsOfInterest) { item in
                    MapMarker(coordinate: item.coordinate, tint: .red)
                }
                .navigationBarTitle(viewModel.school.schoolName, displayMode: .inline)
                // notice how I use safe area insets here by not ignoring them!
                //.edgesIgnoringSafeArea(.all)
            SATDetailsView(viewModel: viewModel.school.satData)
        }
    }
}

struct SchoolDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetailsView(viewModel: SchoolDetailsViewModel(school: School(dbn: "dbn", schoolName: "Prep", location: "London (51.50007773, -0.1246402)", boro: "M"
        )) )
    }
}
