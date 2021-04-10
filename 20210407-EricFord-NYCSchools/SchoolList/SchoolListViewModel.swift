//
//  SchoolListViewModel.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/7/21.
//

import Foundation

class SchoolListViewModel : ObservableObject
{
    @Published var schoolViewModels = [SchoolDetailsViewModel]()

    func loadData() {
        Networking.getSchools(session: URLSession.shared, completionHandler: {
            data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    decoder.dateDecodingStrategy = .secondsSince1970
                    if let schools = try? decoder.decode([School].self, from: data) {
                        DispatchQueue.main.async {
                            self.schoolViewModels = schools.map {
                                school in
                                    SchoolDetailsViewModel(school: school)
                            }
                            Networking.getSATs(session: URLSession.shared, completionHandler: self.getSATsCompletionHandler)
                        }
                    }
                }
        })
    }

    func getSATsCompletionHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let data = data {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970
            if let sats = try? decoder.decode([SATData].self, from: data) {
                 for sat in sats {
                    if let schoolViewModel = schoolViewModels.first(where: { $0.school.dbn == sat.dbn }) {
                        schoolViewModel.school.satData = sat
                    }
                }
            }
        }
    }
}

/*
    func getSchoolsCompletionHandler(data: Data?, response: URLResponse?, error: Error?)
    {

    }
 */
