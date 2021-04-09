//
//  School.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/7/21.
//

import Foundation

struct School: Decodable {
    // these fields are always present as of April 2021
    // better defensive programming would be to have them as optionals in case the
    // data becomes erratic
    let dbn: String
	let schoolName: String
    let location: String
    let boro: String
    // this will arrive later
    var satData: SATData?
}
