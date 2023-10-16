//
//  RSplash2.swift
//  App218
//
//  Created by IGOR on 10/10/2023.
//

import SwiftUI

struct RSplash2: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Image("RSplash2")
                        .resizable()
                        .ignoresSafeArea()

                }
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Smart statistics")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Calculate the return on cashback")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    
                    Spacer()
                    
                    HStack {
                        
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 10, height: 10)
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 10, height: 10)

                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 10, height: 10)
                    }
                    
                    NavigationLink(destination: {
                        
                        RSplash3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("blue")))
                            .padding(.vertical)
                            .padding(.bottom)
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 300)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct RSplash2_Previews: PreviewProvider {
    static var previews: some View {
        RSplash2()
    }
}
