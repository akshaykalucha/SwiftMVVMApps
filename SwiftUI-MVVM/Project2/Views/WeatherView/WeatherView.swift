//
//  WeatherView.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 23/02/22.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var locationManager = LocationManager.shared
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if locationManager.userLocation == nil {
                    LocationRequestView()
                }else{
                    if viewModel.isLoading { LoadingView() }
                    Text(viewModel.timezone)
                        .font(.system(size: 32))
                    Text(viewModel.temp)
                        .font(.system(size: 44))
                    Text(viewModel.title)
                        .font(.system(size: 24))
                    Text(viewModel.descriptionText)
                        .font(.system(size: 24))
                }
                
            }
            .navigationTitle("Weather App")
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
        
    }
}
