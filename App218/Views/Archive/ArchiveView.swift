//
//  ArchiveView.swift
//  App218
//
//  Created by Вячеслав on 10/16/23.
//

import SwiftUI

struct ArchiveView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Archive")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .medium))
                    .padding()
                
                VStack(alignment: .center, spacing: 10, content: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                        .padding(.bottom, 10)
                    
                    Text("Empty")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    Text("No any archived cashback")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                })
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    ArchiveView()
}
