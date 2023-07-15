//
//  BasketView.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 15.07.2023.
//

import SwiftUI

struct BasketView: View {
    //var dishes: Dishes
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                Image("Icons")
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading){
                    Text("Санкт-Петербург")
                        .font(Font.custom("SF Pro Display", size: 18)
                            .weight(.medium))
                    
                    Text("12 Августа, 2023")
                        .font(Font.custom("SF Pro Display", size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black.opacity(0.5))
                }
                Spacer()
                Image("foto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
            }
            ScrollView{
                BasketElementView()
                BasketElementView()
                BasketElementView()
                
            }
            Button {
                //
            } label: {
                HStack(alignment: .center, spacing: 0) {
                    Text("Оплатить")
                        .font(
                            Font.custom("SF Pro Display", size: 16)
                                .weight(.medium)
                        )
                        .kerning(0.1)
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 82)
                .padding(.vertical, 15)
                .background(Color(red: 0.2, green: 0.39, blue: 0.88))
                .cornerRadius(10)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
            
        
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}

struct BasketElementView: View {
    let dishes = Dishes.sampleDishes
    @State var number:Int = 0
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string:dishes.image_url), content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                ProgressView()
            })

            .frame(width: 48, height: 52)
            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
            .cornerRadius(10)
            
            VStack(alignment: .leading){
                Text(dishes.name)
                    .font(Font.custom("SF Pro Display", size: 14))
                    .kerning(0.14)
                    .foregroundColor(.black)
                
                HStack{
                    Text("\(dishes.price)₽ ·")
                        .foregroundColor(.black)
                    Text("\(dishes.weight)г")
                        .foregroundColor(.secondary)
                }
                .font(Font.custom("SF Pro Display", size: 14))
                .kerning(0.14)
            }
            Spacer()
            HStack{
                Button {
                    number = self.number + 1
                } label: {
                    Text("+")
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                }
                Text("\(number)")
                    .frame(width: 24, height: 24)
                Button {
                    number = self.number - 1
                } label: {
                    Text("-")
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .background(Color(red: 0.94, green: 0.93, blue: 0.93))
            .cornerRadius(10)

            
        }
    }
}
