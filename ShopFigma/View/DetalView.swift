//
//  DetalView.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 15.07.2023.
//

import SwiftUI

struct DetalView: View {
    var dishes: Dishes
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                ZStack(alignment: .topTrailing){
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(
                            AsyncImage(url: URL(string:dishes.image_url), content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }, placeholder: {
                                ProgressView()
                            })
                        )
                        .padding()
                        .frame(width: 311, height: 232)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                        .cornerRadius(10)
                    
                    HStack (alignment: .top){
                        HStack(alignment: .center, spacing: 10) {
                            Image(systemName: "heart")
                        }
                        .padding(10)
                        .frame(width: 40, height: 40, alignment: .center)
                        .background(.white)
                        .cornerRadius(8)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(10)
                        .frame(width: 40, height: 40, alignment: .center)
                        .background(.white)
                        .cornerRadius(8)
                    }
                    .padding(8)
                }
                
                Text(dishes.name)
                              .font(Font.custom("SF Pro Display", size: 16)
                              .weight(.medium))
                              .kerning(0.16)
                              .foregroundColor(.black)
                              .padding(.top,8)
                              
                    HStack{
                        Text("\(dishes.price)₽ ·")
                            .foregroundColor(.black)
                        Text("\(dishes.weight)г")
                            .foregroundColor(.secondary)
                    }
                    .font(Font.custom("SF Pro Display", size: 14))
                    .kerning(0.14)
                    .padding(.top,8)
                    
                
                Text(dishes.description)
                .font(Font.custom("SF Pro Display", size: 14))
                .kerning(0.14)
                .foregroundColor(.black.opacity(0.65))
                .frame(width: 311, alignment: .leading)
                .padding(.top,8)
                .padding(.bottom,16)
               
                
                Button {
                    //
                } label: {
                    HStack(alignment: .center, spacing: 0) {
                        Text("Добавить в корзину")
                            .font(
                                Font.custom("SF Pro Display", size: 16)
                                    .weight(.medium)
                            )
                            .kerning(0.1)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal, 82)
                    .padding(.vertical, 15)
                    .background(Color(red: 0.2, green: 0.39, blue: 0.88))
                    .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical,20)
        //.background(.red)
        .cornerRadius(15)
        .navigationBarBackButtonHidden(true)
    }
}

struct DetalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
