//
//  FailureView.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 07.11.22.
//

import SwiftUI

struct FailureView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("❌")
            Text("Something went wrong")
        }
    }
}

struct FailureView_Previews: PreviewProvider {
    static var previews: some View {
        FailureView()
    }
}
