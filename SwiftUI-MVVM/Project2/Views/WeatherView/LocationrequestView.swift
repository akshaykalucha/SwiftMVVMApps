//
//  LocationRequestView.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 23/02/22.
//

import SwiftUI

struct LocationRequestView: View {
    var body: some View {
        VStack{
            Button("allow location") {
                print("allow")
                LocationManager.shared.requestLocation()
            }
        }
    }
}

struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView()
    }
}
