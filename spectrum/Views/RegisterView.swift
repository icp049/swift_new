//
//  RegisterView.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-08.
//

import SwiftUI
import UIKit


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
            HStack {
                Spacer()
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .onTapGesture {
                        // Implement logic to allow users to select a profile picture later
                    }
                
                Spacer()
            }
            
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
            
        Button {
            viewModel.register()
        } label: {
            Text("Create Account")
                .foregroundColor(Color.white)
                .bold()
                .padding(10) // Adjust the padding as needed to make the button smaller
                .background(Color.yellow)
                .cornerRadius(10)
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
        
    }
        
    }


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

