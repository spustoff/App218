//
//  Not.swift
//  App218
//
//  Created by IGOR on 10/10/2023.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    
                Spacer()
            }
            
            VStack {
                
                Spacer()
                                
                VStack {
                    
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Don’t miss important events")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Turn on notifications and always stay informed")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label:  {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                            .padding()
                    })
                    .padding(.top, 60)
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .padding(6)
                            .background(Circle().fill(.gray.opacity(0.3)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
struct Not_Previews: PreviewProvider {
    static var previews: some View {
        Not()
    }
}
