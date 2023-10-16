//
//  MyCashbackView.swift
//  App218
//
//  Created by IGOR on 10/10/2023.
//

import SwiftUI

struct MyCashbackView: View {
    
    @AppStorage("balance") var balance: Int = 0
    
    @StateObject var viewModel = MyCashbackViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
                            
            VStack {
                
                ZStack {
                    
                    
                    Text("My Cashback")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "slider.vertical.3")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .regular))
                        })
                        .opacity(0)
                    }
                }
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        
                        Image("monets")
                        
                        Text("$\(balance)")
                            .foregroundColor(Color("bg2"))
                            .font(.system(size: 18, weight: .regular))
                        
                    }
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    Text("You've saved up your cashback")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 5)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                
                Text("Cashback on cards")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.isAddCard = true
                        
                    }, label: {
                        
                        Text("+")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .regular))
                            .padding()
                    })
                    .frame(height: 120)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    if viewModel.getItems().isEmpty {
                        
                        VStack {
                            
                            Text("Empty history")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text("Try to add new history item")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack {
                                
                                ForEach(viewModel.getItems(), id: \.self) { index in
                                    
                                    HStack {
                                        
                                        VStack {
                                            
                                            Image(index.cardType ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60)
                                            
                                            Text("****\(index.cardNumber ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        VStack {
                                            
                                            Text("$ \(index.cardBalance)")
                                                .foregroundColor(.white)
                                                .font(.system(size: 23, weight: .bold))
                                            
                                            Text("+ \(String(format: "%.2f", Double(.random(in: 1...4))))%")
                                                .foregroundColor(.green)
                                                .font(.system(size: 10, weight: .regular))
                                        }
                                    }
                                    .padding(.horizontal)
                                    .onTapGesture {
                                        
                                        viewModel.currentHaventCard = index.cardType ?? ""
                                    }
                                }
                                .frame(width: 220, height: 150)
                                .background(
                                    
                                    Image("cbg")
                                        .cornerRadius(15)
                                    
                                )
                            }
                        }
                        .frame(height: 130)
                    }
                }
                
                HStack {
                    
                    Text("Lastest cashback")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAddCash = true
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Add new")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .regular))
                            
                            Text("+")
                                .foregroundColor(.black)
                                .font(.system(size: 25, weight: .semibold))
                                .frame(width: 25, height: 25)
                                .background(Circle().fill(.blue))
                            
                        }
                    })
                    
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                
                if viewModel.currentHaventCard == "VISA" {

                    if viewModel.histiryVisa.isEmpty {
                        
                        VStack() {
                            
                            Text("No any VISA cashback")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                                .padding(.top, 60)
                            
                            Text("Add cashback")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            VStack {
                                
                                ForEach(viewModel.histiryVisa, id: \.self) { index in
                                    
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)

                                }
                            }
                            .padding()
                        }
                    }
                    
                } else if viewModel.currentHaventCard == "Google Pay" {
                    
                    if viewModel.histiryGooglePay.isEmpty {
                        
                        VStack() {
                            
                            Text("No any Google Pay cashback")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                                .padding(.top, 60)
                            
                            Text("Add cashback")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            VStack {
                                
                                ForEach(viewModel.histiryGooglePay, id: \.self) { index in
                                    
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)

                                }
                            }
                            .padding()
                        }
                    }
                    
                } else if viewModel.currentHaventCard == "QIWI" {
                    
                    if viewModel.histiryQIWI.isEmpty {
                        
                        VStack() {
                            
                            Text("No any QIWI cashback")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                                .padding(.top, 60)
                            
                            Text("Add cashback")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            VStack {
                                
                                ForEach(viewModel.histiryQIWI, id: \.self) { index in
                                    
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    
                                }
                            }
                            .padding()
                        }
                    }
                    
                } else if viewModel.currentHaventCard == "MasterCard" {
                    
                    if viewModel.histiryMasterCard.isEmpty {
                        
                        VStack() {
                            
                            Text("No any MasterCard cashback")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                                .padding(.top, 60)
                            
                            Text("Add cashback")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            VStack {
                                
                                ForEach(viewModel.histiryMasterCard, id: \.self) { index in
                                    
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    
                                }
                            }
                            .padding()
                        }
                    }
                    
                } else {

                    VStack {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.top, 60)
                        
                        Text("Select card")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.top, 3)
                    }
                }
            }
            }
            .padding()
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            
            viewModel.fetchHistory()
        }
        .fullScreenCover(isPresented: $viewModel.isAddCash, content: {
            
            AddCash()
        })
        .fullScreenCover(isPresented: $viewModel.isAddCard, content: {
            
            NewCardView(mainModel: viewModel)
        })
    }
}

struct MyCashbackView_Previews: PreviewProvider {
    static var previews: some View {
        MyCashbackView()
    }
}
