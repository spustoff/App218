//
//  CalculatorView.swift
//  App218
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    @State var sum = ""
    @State var percents: [String] = ["1", "3", "5", "7", "10"]
    @State var cur_per = "1"
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Calculator")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .medium))
                    .padding()
                
                Text("Purchase sum")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack(alignment: .leading, content: {
                    
                    Text(" $")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .regular))
                        .opacity(sum.isEmpty ? 1 : 0)
                        .padding(.horizontal, 25)
                    
                    TextField(" $", text: $sum)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.2)))
                })
                
                Text("Cashback percentage")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    ForEach(percents, id: \.self) { index in
                        
                        Button(action: {
                            
                            cur_per = index
                            
                        }, label: {
                            
                            Text("\(index) %")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(cur_per == index ? Color("bg3") : .gray.opacity(0.4)))
                        })
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.endEditing()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isResult = true
                    }
                    
                }, label: {
                    
                    Text("Calculate")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("blue")))
                })
                .padding(.bottom)
            }
            .padding([.horizontal, .bottom])
        }
        .overlay(

            result()
        )
    }
    
    @ViewBuilder
    func result() -> some View {

        ZStack {
            
            Color.black.opacity(viewModel.isResult ? 0.5 : 0)
                .ignoresSafeArea()
                .onTapGesture {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isResult = false
                    }
                }
            
            VStack {
                
                Text("You will receive cashback")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                
                Text("$ \(Int(calculatePercentage()))")
                    .foregroundColor(.black)
                    .font(.system(size: 22, weight: .bold))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding()
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.isResult = false
                        
                    }, label: {
                        
                        Text("Ok")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white))
                    })
                    
                    Button(action: {
                        
                        viewModel.isResult = false
                        
                    }, label: {
                        
                        Text("New calculation")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("blue")))
                    })
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
            .padding()
            .offset(y: viewModel.isResult ? 0 : UIScreen.main.bounds.height)

        }
    }
    
    func calculatePercentage() -> Double {
        
        let value = cur_per
        let maxValue = sum
        
        let percentCircle = (Double(value) ?? 0) / (Double(maxValue) ?? 1) * 100
        
        return percentCircle
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
