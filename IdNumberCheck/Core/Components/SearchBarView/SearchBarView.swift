//
//  SearchBarView.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 29.07.2022.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var searchByTax: Bool
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.black)
            
            TextField(searchByTax ? "Vergi No.." : "TC No..." , text: $searchText)
                .keyboardType(.decimalPad)
                .foregroundColor(Color.black)
                .disableAutocorrection(true)
                .overlay(
                Image(systemName: "xmark.circle.fill")
                    .padding()
                    .offset(x: 10)
                    .foregroundColor(Color.black)
                    .opacity(searchText.isEmpty ? 0.0 : 1.0)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        searchText = ""
                    }, alignment: .trailing
                
                )
        }
        .font(.headline)
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.red.opacity(0.5))
            .shadow(color: .white,
                    radius: 10,
                    x: 0,
                    y: 0)
        
        ).padding()
      
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), searchByTax: .constant(true))
    }
}
