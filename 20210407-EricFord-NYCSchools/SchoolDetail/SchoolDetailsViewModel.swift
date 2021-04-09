//
//  SchoolDetailsViewModel.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/8/21.
//

import SwiftUI
import MapKit

class SchoolDetailsViewModel {
    var school: School
    var address: String
    var longitude: Double
    var latitude: Double
    @State var region: MKCoordinateRegion

    init(school: School) {
        self.school = school
        let index = school.location.lastIndex(of: "(")
        address = String(school.location[..<index!])
        var gpsLocation = String(school.location[index!...])
        let parensAndSpace: Set<Character> = ["(", ")", " "]
        gpsLocation.removeAll(where: { parensAndSpace.contains($0) })
        let coords = gpsLocation.split(separator: ",")
        latitude = Double(coords[0])!
        longitude = Double(coords[1])!
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude) , span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
}
