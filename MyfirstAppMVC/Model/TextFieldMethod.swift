//
//  File.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/23/23.
//

import Foundation
import UIKit

struct TextFieldMethod {
    let idmincount = 5
    let idmaxcount = 12
    let passwordmincount = 8
    let passwordmaxcount = 16
    
    var idshould: String?
    var idtextnumbersUP: String?
    var idPattern: String?
    var idCorrect: String?
    var idPatternshould: String?
    var idtextnumbersDown: String?
    
    var emailshould: String?
    var emailPattern: String?
    var emailCorrect: String?
    var emailPatternshould: String?
    var emailNotCorrect: String?

    var passwordshould: String?
    var passwordtextnumbersUP: String?
    var passwordPattern: String?
    var passwordCorrect: String?
    var passwordPatternshould: String?
    var passwordtextnumbersDown: String?
    
    init() {

        self.idshould = "아이디는 필수입력 정보입니다"
        self.idtextnumbersUP = "아이디는 5글자 이상이어야 합니다"
        self.idPattern = "^[a-z0-9_]{\(idmincount),\(idmaxcount)}$"
        self.idCorrect = "조건에 맞는 아이디입니다"
        self.idPatternshould = "소문자, 숫자, 빼기(-), 밑줄(_)만 사용할 수 있습니다."
        self.idtextnumbersDown = "아이디는 12글자 이하이어야 합니다."
        
        self.emailshould = "이메일은 필수로 입력해야 합니다"
        self.emailPattern = #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"#
        self.emailCorrect = "조건에 맞는 이메일 입니다"
        self.emailNotCorrect = "올바르지 않은 이메일 형식입니다"
        
        self.passwordshould = "비밀번호는 필수입력 정보입니다"
        self.passwordtextnumbersUP = "비밀번호는 8글자 이상이어야 합니다"
        self.passwordPattern = #"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{\#(passwordmincount),\#(passwordmaxcount)}$"#
        self.passwordCorrect =  "조건에 맞는 비밀번호입니다"
        self.passwordPatternshould = "영어알파벳, 숫자, 특수문자가 필수로 입력되어야 합니다"
        self.passwordtextnumbersDown = "비밀번호는 16글자 이하이어야 합니다."
    }
}
