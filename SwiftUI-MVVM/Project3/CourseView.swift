//
//  CourseView.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 24/02/22.
//

import SwiftUI



struct CourseView: View {
    
    let animals = ["cat", "dog", "hound"]
    
    var body: some View {
        NavigationView{
            VStack {
                List(animals, id:\.self){ animal in
                    NavigationLink(destination: AnimalView(animal: animal)) {
                        Text("cloicl to go")
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
