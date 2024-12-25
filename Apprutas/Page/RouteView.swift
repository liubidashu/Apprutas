//
//  RouteView.swift
//  Apptest
//
//  Created by Дарья Любивая on 30.11.2024.
//

import SwiftUI

struct RouteView: View {
    var body: some View {
        ScrollView {
            VStack() {
                Color.white.ignoresSafeArea()
                ZStack {
                    Image("Pag")
                    VStack {
                        Rectangle ()
                            .frame(width: 90, height: 90)
                            .foregroundStyle(.clear)
                        HStack{
                            Image("image")
                            Text("Flobara")
                        }
                        .padding(.bottom, 12)
                        Text("Следуй за Фродо")
                            .fontWeight(.medium)
                            .font(.system(size: 26))
                        HStack {
                            ZStack {
                                RoundedRectangle (cornerRadius: 100)
                                    .stroke(lineWidth: 1.0)
                                    .frame(width: 120, height: 22)
                                Text("Властелин Колец")
                                    .font(.system(size: 12))
                                
                            }
                            ZStack {
                                RoundedRectangle (cornerRadius: 100)
                                    .stroke(lineWidth: 1.0)
                                    .frame(width: 68, height: 22)
                                Text("Химки")
                                    .font(.system(size: 12))
                            }
                        }
                        .padding(.bottom, 12)
                        
                        ZStack {
                            RoundedRectangle (cornerRadius: 100)
                                .frame(width: 116, height: 36)
                                .foregroundStyle(.pie)
                            Text("В путь!")
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                        }
                        
                        
                    }
                }
                .padding(.bottom, 14)
                
                HStack {
                    Text("Станция Новые Химки")
                        .fontWeight(.medium)
                        .font(.system(size: 26))
                    ZStack{
                        Circle ()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.pie)
                            .padding()
                        Text("1")
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                    }
                    
                }
                Text("Здесь, среди современных зданий, шумных улиц, ты ощутишь дух древних земель. Пройдя мимо уютных кафе, зеленых парков, представь, что ты шагаешь по тропам Шира")
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                    .padding(8)
                HStack {
                    ZStack {
                        RoundedRectangle (cornerRadius: 100)
                            .stroke(lineWidth: 1.0)
                            .frame(width: 186, height: 42)
                        HStack{
                            Image("geo")
                            Text("Смотреть на карте")
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                        }
                    }
                    Spacer()
                    Rectangle ()
                        .frame(width: 100, height: 1)
                        .foregroundStyle(.clear)
                }
                .padding(18)
                Image("station")
                    .padding(14)
                
                
                HStack {
                    Text("Чаща Химкинского леса")
                        .fontWeight(.medium)
                        .font(.system(size: 26))
                    ZStack{
                        Circle ()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.pie)
                            .padding(10.0)
                        Text("2")
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                    }
                    
                }
                Text("Тишина леса не глухая, она наполнена шепотом ветра, пением птиц и шумом реки. Это музыка лесных духов, которая напоминает о величии всемогущей жизненной силы")
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                    .padding(8)
                HStack {
                    ZStack {
                        RoundedRectangle (cornerRadius: 100)
                            .stroke(lineWidth: 1.0)
                            .frame(width: 186, height: 42)
                        HStack{
                            Image("geo")
                            Text("Смотреть на карте")
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                        }
                    }
                    Spacer()
                    Rectangle ()
                        .frame(width: 100, height: 1)
                        .foregroundStyle(.clear)
                }
                .padding(18)
                Image("les")
                    .padding(14)
                
                HStack {
                    Text("Знаменитый ипподром")
                        .fontWeight(.medium)
                        .font(.system(size: 26))
                    ZStack{
                        Circle ()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.pie)
                            .padding()
                        Text("3")
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                    }
                    
                }
                Text("Добро пожаловать на ипподром в Химках — место, напоминающее захватывающие гонки на полях Рохана! Прогуляйся вдоль манежей, и представь, как герои скакали  на своих верных скакунах")
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                    .padding(8)
                HStack {
                    ZStack {
                        RoundedRectangle (cornerRadius: 100)
                            .stroke(lineWidth: 1.0)
                            .frame(width: 186, height: 42)
                        HStack{
                            Image("geo")
                            Text("Смотреть на карте")
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                        }
                    }
                    Spacer()
                    Rectangle ()
                        .frame(width: 100, height: 1)
                        .foregroundStyle(.clear)
                }
                .padding(18)
                Image("horse")
                    .padding(14)
  
            }

        }

    }
}

#Preview {
    RouteView()
}
