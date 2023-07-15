//
//  ContentView.swift
//  ShopFigma
//
//  Created by Владимир Ширяев on 08.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       //NavigationView{
            TabView {
                NavigationView{
                    Home()
                }
                    .tabItem {
                        Image(systemName: "house.circle")
                        Text("Главная")
                    }
                NavigationView{
                    Magnifying()
                }
                    .tabItem {
                        Image(systemName: "magnifyingglass.circle")
                        Text("поиск")
                    }
                
                NavigationView{
                   BasketView()
                }
                    .tabItem {
                        Image(systemName: "cart.circle")
                            .foregroundColor(.red)
                            .background(.red)
                        Text("корзина")
                    }
                Text("Account")
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                        Text("Account")
                    }
            //}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
