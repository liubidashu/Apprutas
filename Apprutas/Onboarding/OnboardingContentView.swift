//
//  OnboardingContentView.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.


//
//import SwiftUI
//
//struct OnboardingContentView: View {
//    let pages = [
//        OnboardingData(title: "Выбери любимые фандомы", description: "Начни с выбора своих любимых фондомов, а затем установи свою геолокацию, так мы сможем подабрать лушие маршруты, подходящие именно тебе"),
//        OnboardingData(title: "Изучай и проходи маршруты", description: "Исследуй большую библиотеку маршрутов, выбирай понравившийся, зови друзей,проходи путь от первой и до последней точки, не забывай делиться впечатлениями и фотографиями"),
//        OnboardingData(title: "Создавай кастомные маршруты", description: "Смело создавай собственные маршруты по любым фандомам, прописывай точки следования, делись советами и лайфхаками")
//    ]
//    @State private var currentPage = 0
//    var body: some View {
//        VStack {
//            TabView(selection: $currentPage) {
//                ForEach(0..<pages.count, id: \.self) { index in
//                    OnboardingView(data: pages[index])
//                        .tag(index)
//                }
//            }
//            .tabViewStyle(PageTabViewStyle())
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .
//                                               always))
//            HStack {
//                if currentPage > 0 {
//                    Button("Назад"
//                           , action: { currentPage -= 1 })
//                    .foregroundColor(.black)
//                }
//                
//                Spacer()
//                if currentPage < pages.count - 1 {
//                    Button ("Далее"
//                            , action: { currentPage += 1 })
//                    .foregroundColor(.black)
//                    
//                }
//                else {
//                    Button ("Начать"){
//                    }
//                    .foregroundColor(.black)
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//#Preview {
//    OnboardingContentView()
//}

import SwiftUI

struct OnboardingContentView: View {
    let pages = [
        OnboardingData(title: "выбери любимые фандомы", description: "Начни с выбора своих любимых фондомов, а затем установи свою геолокацию, так мы сможем подабрать лушие маршруты, подходящие именно тебе"),
        OnboardingData(title: "изучай и проходи маршруты", description: "Исследуй большую библиотеку маршрутов, выбирай понравившийся, зови друзей,проходи путь от первой и до последней точки, не забывай делиться впечатлениями и фотографиями"),
        OnboardingData(title: "создавай кастомные маршруты", description: "Смело создавай собственные маршруты по любым фандомам, прописывай точки следования, делись советами и лайфхаками")
    ]
    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        if !hasSeenOnboarding {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        OnboardingView(data: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

                HStack {
                    if currentPage > 0 {
                        Button("назад") {
                            currentPage -= 1
                        }
                        .foregroundColor(.black)
                    }

                    Spacer()

                    if currentPage < pages.count - 1 {
                        Button("далее") {
                            currentPage += 1
                        }
                        .foregroundColor(.black)
                    } else {
                        Button("начать") {
                            hasSeenOnboarding = true
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding()
            }
        } 
        else {
            RootTabView()
        }
    }
}

#Preview {
    OnboardingContentView()
}
