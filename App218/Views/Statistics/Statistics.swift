//
//  Statistics.swift
//  App218
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI

struct Statistics: View {
    
    @StateObject var viewModel = StatisticsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .medium))
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Image("currency")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Image("category")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    VStack {
                        
                        HStack {
                            
                            NavigationLink(destination: {}, label: {
                                
                                Text("Period")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })

                            Spacer()
                            
                            ForEach(viewModel.periods, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.cur_per = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                        .frame(width: 25, height: 25)
                                        .background(Circle().fill(viewModel.cur_per == index ? .blue : .gray.opacity(0.4)))
                                })
                            }
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
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    .padding(.vertical)
                    
                }
                
            }
            .padding()
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
