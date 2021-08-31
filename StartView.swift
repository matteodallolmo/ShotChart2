//
//  StartView.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/13/21.
//

import SwiftUI

struct StartView: View {
    
    @State private var password = ""
    @State private var isActive = false
    @State private var admin = false
    @State private var errorMes = ""
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    
                    Text("ShotChart")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Text("Login")
                        .fontWeight(.medium)
                        .font(.largeTitle)
                    
                    HStack {
                        Spacer()
                    }.frame(width: geometry.size.width, height: geometry.size.height/3, alignment: .center)
                    
                    VStack(spacing: 0) {
                        
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.horizontal, 60)
                            .padding(.vertical, 15)
                        
                        Text(errorMes)
                            .foregroundColor(Color.red)
                        
                        VStack(spacing: 0) {
                                
                            NavigationLink(destination: ContentView(admin: admin)
                                .navigationBarTitle("")
                                .navigationBarHidden(true), isActive: $isActive) {
                                Text("")
                            }
                            
                        }
                        
                        Button(action: {
                            
                            if(password == "Wolverine1")
                            {
                                self.isActive = true
                            }
                            else if(password == "")
                            {
                                self.isActive = true
                                self.admin = true
                            }
                            else if(validateFields() != nil)
                            {
                                self.errorMes = self.validateFields()!
                            }
                            else
                            {
                                self.errorMes = "Incorrect password"
                            }
                            
                        }, label: {
                            Text("Submit")
                                .padding(.horizontal, 80)
                                .padding(.vertical, 15)
                                .background(Color.red)
                                .cornerRadius(40)
                                .foregroundColor(Color.white)
                        })
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    func validateFields() -> String?
    {
        //check if filled
        if(password == "")
        {
            return "Please fill in all fields";
        }
        
        return nil
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
