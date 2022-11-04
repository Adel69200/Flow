//
//  Connexion.swift
//  Flow
//
//  Created by Adel Djelti on 20/10/2022.
//

import SwiftUI


struct ConnexionView: View {
    

    @State private var username = ""
    @State private var password = ""
    
    @State private var showingHomeScreen: Bool = false
    @ObservedObject var viewModel = UsersViewModel()
    @State var passwordIncorect: Int = 0
    
    @State var isConnected: Bool = false
    
    var body: some View {
        if(isConnected == false){
            NavigationView{
                ZStack {
                    Color("primaryColor").ignoresSafeArea()
                    VStack{
                        Text("Bienvenue.")
                            .font(.system(size: 25))
                            .foregroundColor(Color("secondaryColor"))
                        
                        Spacer()
                            .frame(height: 600)
                    }
                    
                    VStack{
                        ZStack{
                            Rectangle()
                                .frame(width: 309, height: 26)
                                .cornerRadius(25)
                                .foregroundColor(Color("titleBackgroundColor"))
                                .shadow(color: Color("secondaryColor").opacity(0.7), radius: 4, x: -3, y: 4)
                            
                            HStack {
                                Image(systemName: "person.circle")
                                    .foregroundColor(Color("secondaryColor"))
                                TextField("Identifiant", text: $username)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("secondaryColor"))
                                    .frame(width: 270)
                            }
                        }
                        .padding()
                        
                        ZStack{
                            Rectangle()
                                .frame(width: 309, height: 26)
                                .cornerRadius(25)
                                .foregroundColor(Color("titleBackgroundColor"))
                                .shadow(color: Color("secondaryColor").opacity(0.7), radius: 4, x: -3, y: 4)
                            
                            HStack {
                                Image(systemName: "lock.circle")
                                    .foregroundColor(Color("secondaryColor"))
                                SecureField("Mot de passe ", text: $password)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("secondaryColor"))
                                    .frame(width: 270)
                            }
                        }
                        
                        Text("Mot de passe oublié ? ").bold()
                            .offset(x: 95, y: 10)
                            .font(.system(size: 10))
                            .foregroundColor(Color("secondaryColor"))
                        
                        Spacer()
                            .frame(height: 50)
                        
                        if(passwordIncorect == 1){
                            Text("Nom d'utilisateur ou mot de passe incorrect, veuillez recommencer !")
                                .font(.system(size: 15))
                                .foregroundColor(.red)
                        }
                        
                        Button("Connexion"){
                            autheticateUser(username: username, password: password)
                            isConnected.toggle()
                        }.font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 198,height: 32)
                            .background(Color("buttonColor"))
                            .cornerRadius(20)
                            .padding(1)
                        
                        ButtonInscription()
                        
                        ButtonContinueWithApple()
                    }
                    
                }
                //fin Zstack
            }.navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .onAppear() {
                    Task {
                        await viewModel.fetchUsers()
                    }
                }
        }else{
            TabViewView().environmentObject(LocationsViewModel())
        }
    }
    
    func autheticateUser(username: String, password: String){
        for user in viewModel.users{
            if(username.lowercased() == user.name.lowercased()){
                if(password.lowercased() == user.password.lowercased()){
                        showingHomeScreen = true
                    }else{
                        passwordIncorect = 1
                    }
                }else{
                   passwordIncorect = 1
                }
            }
        }
}

struct ConnexionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnexionView(isConnected: false)
    }
}
















