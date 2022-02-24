//
//  CourseView.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 24/02/22.
//

import SwiftUI

enum Route {
    case animal(String)
}

struct Navigator {
    
    static func navigate<T: View>(_ route: Route, content: () -> T) -> AnyView {
        switch route {
        case .animal(let animal):
            return AnyView(NavigationLink(destination: AnimalView(animal: animal)) {
                content()
            })
        }
    }
}


struct CourseView: View {
    
    let animals = ["cat", "dog", "hound"]
    
    var body: some View {
        NavigationView{
            VStack {
                List(animals, id:\.self){ animal in
                    Navigator.navigate(.animal(animal)) {
                        Text(animal)
                    }
                }
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
