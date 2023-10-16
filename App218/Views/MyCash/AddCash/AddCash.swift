//
//  AddCash.swift
//  App218
//
//  Created by IGOR on 14/10/2023.
//

import SwiftUI

struct AddCash: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = NewCardViewModel()
    
    @AppStorage("balance") var balance: Int = 0
    
    @State var dateFrom: Date = Date()
    @State var dateTo: Date = Date()
    
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
                    
                    Text("New cashback")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .medium))
                }
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

                
                Text("Sum")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("$")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .regular))
                        .opacity(viewModel.cashSum.isEmpty ? 1 : 0)
                        .padding(.horizontal, 25)
                    
                    TextField(" ", text: $viewModel.cashSum)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.2)))
                })
                .padding()
                
                Text("Title")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ZStack(alignment: .leading, content: {
                    
                    Text(" ")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .regular))
                        .opacity(viewModel.cashTitle.isEmpty ? 1 : 0)
                        .padding(.horizontal, 25)
                    
                    TextField(" ", text: $viewModel.cashTitle)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.2)))
                })
                .padding()
                
                Spacer()
                
                Button(action: {

                    if viewModel.currerntCardType == "VISA" {
                                                
                        viewModel.histiryVisa.append("\(viewModel.cashTitle)     \(dateFrom.convertDate(format: "HH:mm"))    \(dateTo.convertDate(format: "MMM d"))               \(viewModel.cashSum)$")
                        
                        balance += Int(viewModel.cashSum) ?? 0
                        
                    } else if viewModel.currerntCardType == "QIWI" {
                        
                        viewModel.histiryQIWI.append("\(viewModel.cashTitle)     \(dateFrom.convertDate(format: "HH:mm"))    \(dateTo.convertDate(format: "MMM d"))               \(viewModel.cashSum)$")
                        
                        balance += Int(viewModel.cashSum) ?? 0
                        
                    } else if viewModel.currerntCardType == "MasterCard" {
                        
                        viewModel.histiryMasterCard.append("\(viewModel.cashTitle)     \(dateFrom.convertDate(format: "HH:mm"))    \(dateTo.convertDate(format: "MMM d"))               \(viewModel.cashSum)$")
                        
                        balance += Int(viewModel.cashSum) ?? 0
                        
                    } else if viewModel.currerntCardType == "Google Pay" {
                        
                        viewModel.histiryGooglePay.append("\(viewModel.cashTitle)     \(dateFrom.convertDate(format: "HH:mm"))    \(dateTo.convertDate(format: "MMM d"))               \(viewModel.cashSum)$")
                        
                        balance += Int(viewModel.cashSum) ?? 0
                        
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
                .opacity(viewModel.cashTitle.isEmpty ? 0.5 : 1)
                .disabled(viewModel.cashTitle.isEmpty || viewModel.cashSum.isEmpty ? true : false)
                
            }
        }
    }
}

struct AddCash_Previews: PreviewProvider {
    static var previews: some View {
        AddCash()
    }
}
