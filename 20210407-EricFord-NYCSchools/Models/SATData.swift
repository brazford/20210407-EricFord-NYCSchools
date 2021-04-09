//
//  SATData.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/8/21.
//

import Foundation

struct SATData: Decodable {
    let dbn: String
    let schoolName: String
    let numOfSatTestTakers: String
    let satCriticalReadingAvgScore: String
    let satMathAvgScore: String
    let satWritingAvgScore: String
}

/*
    let school_name: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String
 */
