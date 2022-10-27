//
//  HomeView.swift
//  Flow
//
//  Created by Apprenant 63 on 20/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isDiscoverMode = false
    @State private var isFavorited = false
    
    let film : FilmHome
    
    var body: some View {
        VStack (spacing : 00) {
            Picker(selection: $isDiscoverMode, label: EmptyView()) {
                Text("A découvrir")
                    .background(Color("primaryColor"))
                    .foregroundColor(Color("secondaryColor"))
                    .tag(true)
                Text("Ce soir je regarde")
                    .tag(false)
                    .foregroundColor(Color("secondaryColor"))
            }.pickerStyle(SegmentedPickerStyle())                    .padding(.top, 30)
               
                
                
                
            
            VStack {
                ScrollView {
                    
                    if isDiscoverMode == true {
                        miniatureFilm(film: FilmHome(title: "Le Seigneur des Anneaux", subTitle: "Les Deux Tours", opus: "VOL2", cover: ""))
                        miniatureSerie(serie: SerieHome(title: "Strangers Things", cover: "", episodeName: "Chapitre 1: La disparition", episodeNumber: 01, season: 01))
                    } else {
                        homeDetail()
                    }
                    
                    
                }.background(Color("primaryColor"))
                    
                
            }
        }.background(Color("primaryColor"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(film: FilmHome(title: "Le Seigneur des Anneaux", subTitle: "Les Deux Tours", opus: "VOL2", cover: ""))
    }
}
