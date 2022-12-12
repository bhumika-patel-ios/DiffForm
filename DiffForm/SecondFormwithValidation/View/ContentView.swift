//
//  ContentView.swift
//  DiffForm
//
//  Created by Bhumika Patel on 06/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var contentBuilder = FormContentBuilderImpl()
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(minimum: 44))], spacing: 20){
                ForEach(contentBuilder.content) { component in
                    switch component{
                    case is TextFormComponent: TextFieldFormView(component: component as! TextFormComponent)
                            .environmentObject(contentBuilder)
                    case is DateFormComponent: DateFormView(component: component as! DateFormComponent)
                            .environmentObject(contentBuilder)
                    case is ButtonFormComponent: ButtonFormView(component: component as! ButtonFormComponent){ id in
                        switch id {
                        case .submit:
                            break
                        default:
                            break
                        }
                    }
                    default:
                        EmptyView()
                    }
                }
            }
            .padding(.top,100)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
