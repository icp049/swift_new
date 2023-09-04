//
//  RegisterView.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-08.
//

import SwiftUI

struct RegisterView: View {
    //attributes
    
    @StateObject var viewModel = RegisterController()
    
    let schoolOptions = ["SLU", "UB"]
    
    
    var body: some View {
        
        Text("Create Account")
            .foregroundColor(Color.green)
            .bold()
            .font(.system(size: 40))
            .padding(.top,60)
        
               //Registration form
        Form{
            
            TextField("First Name", text: $viewModel.firstName)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Last Name", text: $viewModel.lastName)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Username", text: $viewModel.displayName)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            Picker("School", selection: $viewModel.schoolName) {
                            ForEach(schoolOptions, id: \.self) { school in
                                Text(school).tag(school)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
            
           
            
            
        }
            
            Button{
                viewModel.register()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.yellow)
                    
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .bold()
                }
                
            }
           
        }
        
        
        
        
        
    }


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

