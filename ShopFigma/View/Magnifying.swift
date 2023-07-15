//
//  Magnifying.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 09.07.2023.
//

import SwiftUI

struct Magnifying: View {

    @State var magnifying: String = ""
    private var dishes: [Dishes] = Dishes.allDishes
    private let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass.circle")
                TextField("поиск", text: $magnifying)
                    .padding(10)
                    .background(.white)
                    .foregroundColor(.black)
            }
            .padding(.leading,15)
            .background(.secondary).opacity(0.5)
            .cornerRadius(20)
    
            Spacer()
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(dishes, id: \.id) {dishes in
                        VStack(alignment:.leading) {
                            ZStack{
                                Rectangle()
                                .foregroundColor(.clear)
                                    AsyncImage(url: URL(string:dishes.image_url), content: { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }, placeholder: {
                                        ProgressView()
                                    })
                            }
                            .padding(.leading, 17)
                            .padding(.trailing, 13)
                            .padding(.top, 14)
                            .padding(.bottom, 7)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                            .cornerRadius(10)
                            .frame(width: 109, height: 109)
                            
                            Text(dishes.name)
                                .font(Font.custom("SF Pro Display", size: 13))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .frame(height: 30)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                }
            }
        }
        .padding()
    }
}

struct Magnifying_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        Magnifying()
    }
}
