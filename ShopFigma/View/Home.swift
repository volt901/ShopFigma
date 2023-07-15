//
//  Home.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 08.07.2023.
//

import SwiftUI

struct Home: View {
    private var category: [Сategory] = Сategory.allСategory
    
    var body: some View {
        // NavigationView{
        VStack{
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
                ForEach(category, id: \.name) { categor in
                    NavigationLink(destination: DishesView(category: categor)) {
                        ZStack(alignment:.topLeading){
                            AsyncImage(url: URL(string:categor.image_url), content: { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            }, placeholder: {
                                ProgressView()

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(Color(categor.background))
                            .cornerRadius(10)
                            
                            Text(categor.name)
                                .font(Font.custom("SF Pro Display", size: 20)
                                    .weight(.medium))
                                .kerning(0.2)
                                .foregroundColor(.black)
                                .frame(width: 191, alignment: .leading)
                                .padding(.top, 12)
                                .padding(.leading,16)
                        }
                    }
                }
            }
        }
        .padding(.horizontal,20)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //Home()
    }
}
