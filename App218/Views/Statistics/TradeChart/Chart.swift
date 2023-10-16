//
//  Chart.swift
//  App218
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI

struct Chart: View {
    
    @StateObject var viewModel = StatisticsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Back")
                            .foregroundColor(.blue)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                    }
                    
                    Text("Currency")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .medium))
                }
                .padding()
                
                HStack {
                    
                    Text("$\(String(format: "%.2f", Double(.random(in: 230...330))))")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Text("+\(String(format: "%.f", Double(.random(in: 1...5))))%")
                        .foregroundColor(.green)
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                TradeChart(pair: viewModel.selected_valut)
                    .disabled(true)
                    
                Menu {
                    
                    ForEach(viewModel.valuts, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.selected_valut = index
                            
                        }, label: {
                            
                            HStack {
                                
                                Text(index)
                                
                                Spacer()

                            }
                        })
                    }
                    
                } label: {
                    
                    Text("\(viewModel.selected_valut)")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 45)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                }
                .padding(.horizontal)
                .padding(.bottom, 60)
                
                Spacer()
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart()
    }
}
