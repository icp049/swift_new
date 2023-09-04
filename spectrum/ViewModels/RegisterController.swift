//
//  RegisterViewViewModel.swift
//  Dump
//
//  Created by Ian Pedeglorio on 2023-06-08.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


class RegisterController: ObservableObject{
    
    
   
    @Published var email = ""
    @Published var displayName = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var schoolName = ""
   
    

    init() {}
    
    
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password)
        {[weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id:userId)
        }
    }
    
    private func insertUserRecord(id:String){
        let newUser = User(
                id: id,
                firstname: firstName,   // Use lowercase "firstname" here
                lastname: lastName,     // Use lowercase "lastname" here
                username: displayName,  // Use lowercase "username" here
                email: email,
                schoolname: schoolName
            
            )
        
        let db = Firestore.firestore()
        db.collection("Users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    
    
    
   
    private func validate() -> Bool {
        // Check that none of the fields are empty
        guard !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty,
              !displayName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty
               else {
            return false
        }
        
        // Check for a valid email address
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        // Check password length
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }

}
                                                    

