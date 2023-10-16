//
//  Reviews.swift
//  App218
//
//  Created by IGOR on 10/10/2023.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Image("Reviews")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Share your experience")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Rate us in the App Store")
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

                    }
                    
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            Join(telegram: telegram, isContacts: isContacts)
                                .navigationBarBackButtonHidden()
                            
                        } else if isTelegram == false {
                            
                            if isContacts == true {
                                
                                Manager()
                                    .navigationBarBackButtonHidden()
                                
                            } else if isContacts == false {
                                
                                Not()
                                    .navigationBarBackButtonHidden()
                            }
                        }
                        
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
        .onAppear{
            
            SKStoreReviewController.requestReview()
        }
    }
}

struct Reviews_Previews: PreviewProvider {
    static var previews: some View {
        Reviews(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
    }
}
