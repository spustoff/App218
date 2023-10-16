//
//  Period.swift
//  App218
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI

struct Period: View {
    
    @Environment(\.presentationMode) var router
    @StateObject var viewModel = StatisticsViewModel()
    
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
                    
                    Text("Period")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .medium))
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                                            
                        HStack {
                            
                            NavigationLink(destination: {}, label: {
                                
                                Text("Week")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            
                            Spacer()

                        }
                        
                        Spacer()
                        
                        HStack {
                            
                            ForEach(viewModel.days, id: \.self) { index in
                                
                                VStack {
                                    
                                    Spacer()
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color("blue"))
                                        .frame(width: 7, height: Double(.random(in: 1...210)))
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                    .padding()
                    
                    VStack {
                                                
                            HStack {
                                
                                NavigationLink(destination: {}, label: {
                                    
                                    Text("Month")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                })
                                
                                Spacer()

                            }
                            
                            Spacer()
                            
                            HStack {
                                
                                ForEach(viewModel.months, id: \.self) { index in
                                    
                                    VStack {
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color("purple"))
                                            .frame(width: 7, height: Double(.random(in: 1...210)))
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 8, weight: .regular))
                                            .frame(maxWidth: .infinity)
                                    }
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    VStack {
                                                
                            HStack {
                                
                                NavigationLink(destination: {}, label: {
                                    
                                    Text("Year")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                })
                                
                                Spacer()

                            }
                            
                            Spacer()
                            
                            HStack {
                                
                                ForEach(viewModel.year, id: \.self) { index in
                                    
                                    VStack {
                                        
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color("b"))
                                            .frame(width: 7, height: Double(.random(in: 1...210)))
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 10, weight: .regular))
                                            .frame(maxWidth: .infinity)
                                    }
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                        .padding(.horizontal)
                    
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Period_Previews: PreviewProvider {
    static var previews: some View {
        Period()
    }
}
