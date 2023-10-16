//
//  TabBar.swift
//  App218
//
//  Created by Вячеслав on 10/16/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 12, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("blue") : Color.gray)
                            .frame(height: 22)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("blue") : Color.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color.gray.opacity(0.1))
    }
}

enum Tab: String, CaseIterable {
    
    case My_Cashback = "My Cashback"
    
    case Statistics = "Statistics"
    
    case Calculator = "Calculator"
    
    case Archive = "Archive"
    
}

#Preview {
    ContentView()
}
