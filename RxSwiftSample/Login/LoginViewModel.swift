//
//  LoginViewModel.swift
//  RxSwiftSample
//
//  Created by Kazunori Takaishi on 2018/04/29.
//  Copyright © 2018 Kazunori Takaishi. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    var userName = Variable<String>("")
    var password = Variable<String>("")
    
    var isValid: Observable <Bool> {
        get {
            return Observable.combineLatest(userName.asObservable(), password.asObservable(), resultSelector: {(userName, password) in
                self.validate(userName: userName, password: password)
            })
        }
    }
    
    func attemptToLogin() {
        // attempt to login
    }
    
    private func validate(userName: String, password: String) -> Bool {
        // do required validation check
        return !userName.isEmpty && !password.isEmpty
    }
}
