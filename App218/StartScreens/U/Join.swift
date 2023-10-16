//
//  Join.swift
//  App218
//
//  Created by IGOR on 10/10/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    let isContacts: Bool
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Image("Join")
                        .resizable()
                        .ignoresSafeArea()

                }
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Join our Telegram Channel")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("and trade with our team")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    
                    Spacer()

                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
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
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        if isContacts == true {
                            
                            Manager()
                                .navigationBarBackButtonHidden()
                            
                        } else if isContacts == false {
                            
                            Not()
                                .navigationBarBackButtonHidden()
                        }
                        
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
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join(telegram: URL(string: "h")!, isContacts: false)
    }
}
