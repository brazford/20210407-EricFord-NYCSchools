//
//  Networking.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/7/21.
//

import Foundation

class Networking {
    static let nycAppToken = "ZbEbkjbcZvPalXNVQfV6LyXnA"

    static func getSchools(session: URLSession, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        print("getSchools")
        if let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") {
            var request = URLRequest(url: url)
            request.addValue(nycAppToken, forHTTPHeaderField: "X-App-Token")
            session.dataTask(with: request) {
                data, response, error in
                    print("completionHandler")
                    completionHandler(data, response, error)
            }.resume()
        }
        else {
            print("bad url")
        }
    }

    static func getSATs(session: URLSession, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        print("getSATs")
        if let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") {
            var request = URLRequest(url: url)
            request.addValue(nycAppToken, forHTTPHeaderField: "X-App-Token")
            session.dataTask(with: request) {
                data, response, error in
                    print("completionHandler")
                    completionHandler(data, response, error)
            }.resume()
        }
        else {
            print("bad url")
        }
    }

}
