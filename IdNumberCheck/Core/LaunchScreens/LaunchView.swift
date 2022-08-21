//
//  LaunchScreenView.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 21.08.2022.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Veriler Yükleniyor...".map { String($0) }
    @State private var showLoading = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    @State private var loops = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color("AccentColor").ignoresSafeArea()
            
            Image("LogoImage")
                .resizable()
                .frame(width: 100, height: 100)
            ZStack {
                if showLoading {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .offset(y: counter == index ? -10 : 0)
                                .background(Color.white.opacity(0.001))
                                .shadow(color: Color.black.opacity(0.5), radius: 10)
                        }
                    }.transition(AnyTransition.scale.animation(.easeInOut))
                }
            }.offset(y: 70)
        }.onAppear {
            showLoading.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
