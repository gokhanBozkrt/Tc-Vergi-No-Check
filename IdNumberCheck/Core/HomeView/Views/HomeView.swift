//
//  HomeView.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 27.07.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    @State private var showAlert = false
    var body: some View {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                ZStack {
                    VStack {
                        SearchBarView(searchText: $vm.idNumber, searchByTax: $vm.vergiNoSorgula)
                      
                        Button {
                            vm.save()
                            UIApplication.shared.endEditing()
                         
                        } label: {
                            Text(!vm.vergiNoSorgula ? "TC Doğrula": "Verigi No Doğrula")
                                .font(.headline)
                                .withDefaultButtonFormatting(backgroundColor: .green)
                        }
                        .disabled(vm.idNumber.isEmpty)
                        .padding()
                        .withPressableButton()

                        if !vm.vergiNoSorgula {
                            idNumbersList
                                .transition(.move(edge: .leading))

                        } else {
                            taxNumbersList
                                .transition(.move(edge: .trailing))

                        }
                        
                        Spacer()
                    }
                    
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            vm.vergiNoSorgula.toggle()
                        }
                    } label: {
                        Text(vm.vergiNoSorgula ? "TC No" : "Vergi No")
                            .font(.headline)
                            .bold()
                            .foregroundColor(Color.white)
                            .background(.white.opacity(0.2))
                            .shadow(color: .pink,
                                    radius: 10,
                                    x: 0,
                                    y: 0)
                        
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showAlert.toggle()
                    } label: {
                        Label("Hepsini Sil",systemImage: "trash.fill")
                            .foregroundColor(.pink.opacity(1.2))
                            .shadow(color: .white,
                                    radius: 10,
                                    x: 0,
                                    y: 0)
                    }

                }
            }
            .alert("Hepsni Sil", isPresented: $showAlert) {
                Button("Cancel", role: .cancel) {  }
                Button("Sil",role: .destructive) { vm.deleteAll() }
            } message: {
                Text("Bu aksiyon yaptığın tüm sorgulamaları silecektir.Emin misin⁉️")
            }
        }
    }



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                 
        }.environmentObject(HomeViewModel())
    }
}

extension HomeView {
    private var idNumbersList: some View {
        List {
            ForEach(vm.nationalIdNumbers) { sonuc in
                    HStack {
                        Text(sonuc.requestResult ? "🥳" : "☹️")
                        Text(sonuc.tcNo)
                        Text(sonuc.requestDate.displayFormat)
                    } .listRowBackground(Color("BackgroundColor"))
            }
        }.listStyle(.grouped)
    }
    private var taxNumbersList: some View {
        List {
            ForEach(vm.taxNumbers) { sonuc in
                    HStack {
                        Text(sonuc.requestResult ? "🥳" : "☹️")
                        Text(sonuc.vergiNo)
                        Text(sonuc.requestDate.displayFormat)
                    } .listRowBackground(Color("BackgroundColor"))
                
            }
        }.listStyle(.grouped)
    }
}
