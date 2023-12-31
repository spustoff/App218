//
//  LoadingView.swift
//  App218
//
//  Created by IGOR on 14/10/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("lwbg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
            }
            .padding()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
