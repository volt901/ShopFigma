//
//  DishesView.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 09.07.2023.
//

import SwiftUI

struct DishesView: View {
    var dishes: [Dishes] = Dishes.allDishes
    var category: Сategory
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    @Environment(\.dismiss) private var dismiss
    
    @State var selected: String = "Все меню"
    @State private var showingSheet = false
    
    var body: some View {
        VStack{
            let tegSet = TegSet(dishes: dishes).sorted()
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(tegSet, id: \.self){ tegset in
                        Text(tegset)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(tegset == selected ? .blue : Color(red: 0.97, green: 0.97, blue: 0.96))
                            .cornerRadius(10)
                            .font(Font.custom("SF Pro Display", size: 14))
                            .kerning(0.14)
                            .foregroundColor(tegset == selected ? .white : .black)
                            .onTapGesture{
                                selected = tegset
                            }
                    }
                }
            }
            //  фильтр не реализован 
            .padding(.top)
            .padding(.horizontal,10)
            
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(dishes, id: \.id) {dishes in
                        NavigationLink(destination: DetalView(dishes: dishes)) {
                            // понимаю, что нужно было через sheet  реализовать , но выводил при любом нажатии первый элемент dishes
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
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(height: 30)
                                
                            }
                            
                        }                     }
                    .frame(maxWidth: .infinity)
                    .padding()
                    
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Image("foto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
            }
        }
        .navigationTitle(category.name)
    }
    
    func TegSet(dishes: [Dishes]) -> [String] {
        var tegSet = Set<String>()
        for dishes1 in dishes {
            for dishes2 in dishes1.tegs {
                tegSet.insert(dishes2)
            }
        }
        return [String](tegSet)
    }
}



struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

