//
//  VignetteFilm.swift
//  Flow
//
//  Created by Adel Djelti on 25/10/2022.
//

import SwiftUI

struct VignetteFilm: View {
    
    var gradientTop: Color = Color(red: 0 / 255, green: 70 / 255, blue: 67 / 255)
    var gradientBottom: Color = Color(red: 149 / 255, green: 191 / 255, blue: 181 / 255)
    
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
   
    
    var body: some View {
        
        VStack(alignment: .leading){
                Text("Les plus regardés sur Netflix").bold().font(.title2).offset(x: -10, y: 0)
                    .foregroundColor(Color("secondaryColor"))
                    .font(.system(size: 20))
                    .padding(.leading, 30)

                LazyVGrid(columns: columns){
                    ForEach(films) { film in
                        FilmDetails(film: film)
                    }
                }
                .frame(width: 352, height: 480)
            }.padding(.top, 20)
            .background(
                Rectangle()
                    .fill(LinearGradient(
                        gradient: .init(colors: [self.gradientTop, self.gradientBottom]),
                        startPoint: .init(x: 0.5, y: 0),
                        endPoint: .init(x: 0.5, y: 0.9)
                    ))
                    .cornerRadius(10)
                    .opacity(0.3)
                    .shadow(color: Color("secondaryColor").opacity(0.7), radius: 4, x: -3, y: 4)
                    .frame(height: 550)
            )
        }
    }


struct VignetteFilm_Previews: PreviewProvider {
    static var previews: some View {
        VignetteFilm()
    }
}

struct FilmDetails: View {
    var film : FilmHome
    @State private var isSelected = false
    var body : some View {
        ZStack(alignment: .bottomTrailing) {
            Image(film.cover)
                .resizable()
                .frame(width: 97,height: 145)
                .cornerRadius(10)
                .shadow(color: Color("secondaryColor").opacity(0.7), radius: 4, x: -3, y: 4)
                .padding(1)
            SelectedButton(isSelected: $isSelected)
        }
    }
}

struct SelectedButton: View {
    @Binding var isSelected: Bool
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            Image(systemName: isSelected ? "checkmark.circle.fill" : "checkmark.circle")
                .font(.largeTitle)
        }
        
    }
}

