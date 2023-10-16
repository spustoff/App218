//
//  NewCardView.swift
//  App218
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI

struct NewCardView: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = NewCardViewModel()
    @StateObject var mainModel: MyCashbackViewModel
    
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
                    
                    Text("New card")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .medium))
                }
                .padding()
                
                Text("Card Number")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("**** ")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .regular))
                        .opacity(viewModel.cardNumber.isEmpty ? 1 : 0)
                        .padding(.horizontal, 25)
                    
                    TextField("**** ", text: $viewModel.cardNumber)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.2)))
                })
                .padding()
                
                Text("Card Balance")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ZStack(alignment: .leading, content: {
                    
                    Text(" $")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .regular))
                        .opacity(viewModel.cardBalance.isEmpty ? 1 : 0)
                        .padding(.horizontal, 25)
                    
                    TextField(" $", text: $viewModel.cardBalance)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.2)))
                })
                .padding()
                
                VStack(alignment: .leading) {
                    
                    ForEach(viewModel.card_types, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currerntCardType = index
                            
                        }, label: {
                        
                        HStack {
                            
                            ZStack {
                                
                                Circle()
                                    .stroke(.white.opacity(0.4))
                                    .frame(width: 20, height: 20)
                                
                                Circle()
                                    .fill(Color("blue"))
                                    .frame(width: 15, height: 15)
                                    .opacity(viewModel.currerntCardType == index ? 1 : 0)
                                
                            }
                            .padding(.trailing)
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()

                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addToHistory {
                                                
                        mainModel.fetchHistory()
                        
                        viewModel.cardNumber = ""
                        viewModel.cardBalance = ""
                        viewModel.cardType = ""
                    }
                    
                    router.wrappedValue.dismiss()

                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("blue")))
                        .padding()
                })
                .opacity(viewModel.cardNumber.isEmpty || viewModel.cardBalance.isEmpty ? 0.5 : 1)
                .disabled(viewModel.cardNumber.isEmpty || viewModel.cardBalance.isEmpty ? true : false)
            }
        }
    }
}

struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView(mainModel: MyCashbackViewModel())
    }
}
