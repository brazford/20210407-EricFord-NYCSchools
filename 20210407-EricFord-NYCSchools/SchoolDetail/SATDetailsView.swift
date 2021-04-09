//
//  SATDetailsView.swift
//  20210407-EricFord-NYCSchools
//
//  Created by 2016 iMac on 4/8/21.
//

import SwiftUI

struct SATDetailsView: View {
    @State var viewModel: SATData?

    var body: some View {
        let numberOfTakers = viewModel?.numOfSatTestTakers ?? "No Data"
        Text("Number of SAT takers: \(numberOfTakers)")
        let criticalReadingAvg = viewModel?.satCriticalReadingAvgScore ?? "No Data"
        Text("Critical Reading Average Score: \(criticalReadingAvg)")
        let satMathAvgScore = viewModel?.satMathAvgScore ?? "No Data"
        Text("Math Average Score: \(satMathAvgScore)")
        let satWritingAvgScore = viewModel?.satWritingAvgScore ?? "No Data"
        Text("Writing Average Score: \(satWritingAvgScore)")
    }
}

struct SATDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SATDetailsView(viewModel: SATData(dbn: "dbn", schoolName: "School Name", numOfSatTestTakers: "1", satCriticalReadingAvgScore: "1", satMathAvgScore: "1", satWritingAvgScore: "1"))
    }
}
