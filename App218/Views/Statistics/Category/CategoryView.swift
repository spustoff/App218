//
//  CategoryView.swift
//  App218
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI

struct CategoryView: View {
    
    @Environment(\.presentationMode) var router
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                    }
                    
                    Text("Category")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .medium))
                }
                .padding()
                
                
                
                Spacer()
                
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
