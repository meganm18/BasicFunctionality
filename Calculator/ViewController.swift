//
//  ViewController.swift
//  Calculator
//
//

import SwiftUI

enum Operator {
    case add
    case subtract
    case multiply
    case divide
}

struct ViewController: View {
    @State private var currentNum = 0.0
    @State private var done = false
    @State private var operator1 = Operator.add
    @State private var prevNum1 = 0.0
    @State private var operator2 = Operator.add
    @State private var prevNum2 = 0.0
    @State private var error = false
    @State private var decimalNum = 0
    
    var body: some View {
        ZStack {
            
            //Background
            Rectangle()
                .foregroundColor(.green)
                .edgesIgnoringSafeArea(.all)
                
            //Content
            VStack {
                Spacer()
                
                //Title
                Text("Calculator")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .foregroundColor(.white)
                    .scaleEffect(3)
                
                Spacer()
                
                //Current Result
                if(self.done) {
                    if(self.prevNum2 == 0.0 && (self.operator2 == Operator.add)) {
                        Text(String(self.prevNum1))
                            .scaleEffect(3)
                            .frame(maxHeight: 100)
                    }
                    else {
                        if(self.operator2 == Operator.add){
                            Text(String(self.prevNum2) + " + " + String(self.prevNum1))
                                .scaleEffect(3)
                                .frame(maxHeight: 100)
                        }
                        else if(self.operator2 == Operator.subtract){
                            Text(String(self.prevNum2) + " - " + String(self.prevNum1))
                                .scaleEffect(3)
                                .frame(maxHeight: 100)
                        }
                        else if(self.operator2 == Operator.multiply){
                            Text(String(self.prevNum2) + " * " + String(self.prevNum1))
                                .scaleEffect(3)
                                .frame(maxHeight: 100)
                        }
                        else{
                            Text(String(self.prevNum2) + " / " + String(self.prevNum1))
                                .scaleEffect(3)
                                .frame(maxHeight: 100)
                        }
                    }
                }
                else{
                    Text(String(currentNum))
                        .scaleEffect(3)
                        .frame(maxHeight: 100)
                }
                
                if(self.error){
                    Text("ERROR: Divide By 0")
                        .foregroundColor(.red)
                        .scaleEffect(1.5)
                }
                
                Spacer()
                
                //Buttons
                VStack{
                    HStack {
                        Spacer()
                            .frame(maxWidth: 20)
                        
                        Button(action: {
                            self.solveAddSubtract()
                            self.operator1 = Operator.add
                        }) {
                            Text("+")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .padding(.all, 5)
                        }
                            .cornerRadius(60)
                        Button(action: {
                            self.solveAddSubtract()
                            if(!self.error){
                                self.operator1 = Operator.subtract
                            }
                            }) {
                            Text("-")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .padding(.all, 5)
                        }
                            .cornerRadius(60)
                        Button(action: {
                            self.solveMultiplyDivide()
                            if(!self.error){
                                self.operator1 = Operator.multiply
                            }
                            }) {
                            Text("*")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .padding(.all, 5)
                        }
                            .cornerRadius(60)
                        Button(action: {
                            self.solveMultiplyDivide()
                            if(!self.error){
                                self.operator1 = Operator.divide
                            }
                            }) {
                            Text("/")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .padding(.all, 5)
                        }
                            .cornerRadius(60)
                        Spacer()
                            .frame(maxWidth: 20)
                    }
                    
                    HStack {
                        Spacer()
                            .frame(maxWidth: 20)
                        Button(action: {
                            var multiplier = 10.0
                            var addend = 7.0
                            if (self.decimalNum != 0){
                                multiplier = 1
                                self.decimalNum += 1
                                for _ in 1...(self.decimalNum - 1) {
                                    addend /= 10
                                }
                            }
                            self.currentNum = self.currentNum * multiplier + addend
                            self.error = false
                            self.done = false
                                }) {
                                Text("7")
                                    .bold()
                                    .scaleEffect(1.5)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .padding(.all, 5)
                        }
                        Button(action: {
                                var multiplier = 10.0
                                var addend = 8.0
                                if (self.decimalNum != 0){
                                    multiplier = 1
                                    self.decimalNum += 1
                                    for _ in 1...(self.decimalNum - 1) {
                                        addend /= 10
                                    }
                                }
                                self.currentNum = self.currentNum * multiplier + addend
                                self.error = false
                                self.done = false
                                }) {
                                Text("8")
                                    .bold()
                                    .scaleEffect(1.5)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .padding(.all, 5)
                        }
                        Button(action: {
                                var multiplier = 10.0
                                var addend = 9.0
                                if (self.decimalNum != 0){
                                    multiplier = 1
                                    self.decimalNum += 1
                                    for _ in 1...(self.decimalNum - 1) {
                                        addend /= 10
                                    }
                                }
                                self.currentNum = self.currentNum * multiplier + addend
                                self.error = false
                                self.done = false
                                }) {
                                Text("9")
                                    .bold()
                                    .scaleEffect(1.5)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .padding(.all, 5)
                        }
                        Spacer()
                            .frame(maxWidth: 20)
                    }
                    
                    HStack {
                        Spacer()
                            .frame(maxWidth: 20)
                        Button(action: {
                                var multiplier = 10.0
                                var addend = 4.0
                                if (self.decimalNum != 0){
                                    multiplier = 1
                                    self.decimalNum += 1
                                    for _ in 1...(self.decimalNum - 1) {
                                        addend /= 10
                                    }
                                }
                                self.currentNum = self.currentNum * multiplier + addend
                                self.error = false
                                self.done = false
                                }) {
                                Text("4")
                                    .bold()
                                    .scaleEffect(1.5)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .padding(.all, 5)
                        }
                        Button(action: {
                                var multiplier = 10.0
                                var addend = 5.0
                                if (self.decimalNum != 0){
                                    multiplier = 1
                                    self.decimalNum += 1
                                    for _ in 1...(self.decimalNum - 1) {
                                        addend /= 10
                                    }
                                }
                                self.currentNum = self.currentNum * multiplier + addend
                                self.error = false
                                self.done = false
                                }) {
                                Text("5")
                                    .bold()
                                    .scaleEffect(1.5)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .padding(.all, 5)
                        }
                        Button(action: {
                                var multiplier = 10.0
                                var addend = 6.0
                                if (self.decimalNum != 0){
                                    multiplier = 1
                                    self.decimalNum += 1
                                    for _ in 1...(self.decimalNum - 1) {
                                        addend /= 10
                                    }
                                }
                                self.currentNum = self.currentNum * multiplier + addend
                                self.error = false
                                self.done = false
                                }) {
                                Text("6")
                                    .bold()
                                    .scaleEffect(1.5)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .padding(.all, 5)
                        }
                        Spacer()
                            .frame(maxWidth: 20)
                    }
                    
                    HStack {
                        Spacer()
                            .frame(maxWidth: 20)
                        
                        Button(action: {
                            var multiplier = 10.0
                            var addend = 1.0
                            if (self.decimalNum != 0){
                                multiplier = 1
                                self.decimalNum += 1
                                for _ in 1...(self.decimalNum - 1) {
                                    addend /= 10
                                }
                            }
                            self.currentNum = self.currentNum * multiplier + addend
                            self.error = false
                            self.done = false
                            }) {
                            Text("1")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .padding(.all, 5)
                        }
                        Button(action: {
                            var multiplier = 10.0
                            var addend = 2.0
                            if (self.decimalNum != 0){
                                multiplier = 1
                                self.decimalNum += 1
                                for _ in 1...(self.decimalNum - 1) {
                                    addend /= 10
                                }
                            }
                            self.currentNum = self.currentNum * multiplier + addend
                            self.error = false
                            self.done = false
                            }) {
                            Text("2")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .padding(.all, 5)
                        }
                        Button(action: {
                            var multiplier = 10.0
                            var addend = 3.0
                            if (self.decimalNum != 0){
                                multiplier = 1
                                self.decimalNum += 1
                                for _ in 1...(self.decimalNum - 1) {
                                    addend /= 10
                                }
                            }
                            self.currentNum = self.currentNum * multiplier + addend
                            self.error = false
                            self.done = false
                            }) {
                            Text("3")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .padding(.all, 5)
                        }
                        Spacer()
                            .frame(maxWidth: 20)
                    }
                    HStack {
                        Spacer()
                            .frame(maxWidth: 20)
                        Button(action: {
                            if(self.decimalNum == 0){
                                self.currentNum = self.currentNum * 10
                            }
                            else{
                                self.decimalNum += 1
                            }
                            self.error = false
                            self.done = false
                            }) {
                            Text("0")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .padding(.all, 5)
                        }
                        Button(action: {
                            self.decimalNum += 1
                            }) {
                            Text(".")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .padding(.all, 5)
                        }
                        //Sign Button
                        Button(action: {
                            self.currentNum *= -1
                        }) {
                            Text("+/-")
                            .bold()
                            .scaleEffect(1.5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .padding(.all, 5)
                        }
                        
                        Spacer()
                            .frame(maxWidth: 20)
                    }
                    
                    HStack{
                        Spacer()
                            .frame(maxWidth: 20)
                    
                        Button(action: {
                            self.reset()
                        }) {
                            Text("Clear")
                            .bold()
                            .scaleEffect(1.5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .padding(.all, 5)
                        }
                            .cornerRadius(60)
                        Button(action: {
                            self.solveEqual()
                            self.operator1 = Operator.add
                            }) {
                            Text("=")
                                .bold()
                                .scaleEffect(1.5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .padding(.all, 5)
                        }
                            .cornerRadius(60)
                        Spacer()
                            .frame(maxWidth: 20)
                    }
                }
               Spacer()
                .frame(maxHeight: 20)
            }
        }
    }
    
    func reset(){
        self.currentNum = 0.0
        self.prevNum1 = 0.0
        self.prevNum2 = 0.0
        self.operator1 = Operator.add
        self.operator2 = Operator.add
        self.decimalNum = 0
        self.error = false
    }
    
    func solveAddSubtract() {
        if ((self.currentNum == 0.0 && self.operator1 == Operator.divide) || (self.prevNum1 == 0.0 && self.operator2 == Operator.divide)){
            self.reset()
            self.error = true
        }
        else {
            switch self.operator2 {
            case .add:
                switch self.operator1 {
                    case .add:
                        self.prevNum1 += self.prevNum2 + self.currentNum
                    case .subtract:
                        self.prevNum1 += self.prevNum2 - self.currentNum
                    case .multiply:
                        self.prevNum1 = self.prevNum2 + self.prevNum1 * self.currentNum
                    case .divide:
                        self.prevNum1 = self.prevNum2 + self.prevNum1 / self.currentNum
                }
            case .subtract:
                switch self.operator1 {
                    case .add:
                        self.prevNum1 = self.prevNum2 - self.prevNum1 + self.currentNum
                    case .subtract:
                        self.prevNum1 = self.prevNum2 - self.prevNum1 - self.currentNum
                    case .multiply:
                        self.prevNum1 = self.prevNum2 - self.prevNum1 * self.currentNum
                    case .divide:
                        self.prevNum1 = self.prevNum2 - self.prevNum1 / self.currentNum
                }
            case .multiply:
                switch self.operator1 {
                    case .add:
                        self.prevNum1 = self.prevNum2 * self.prevNum1 + self.currentNum
                    case .subtract:
                        self.prevNum1 = self.prevNum2 * self.prevNum1 - self.currentNum
                    case .multiply:
                        self.prevNum1 *= self.prevNum2 * self.currentNum
                    case .divide:
                        self.prevNum1 = self.prevNum2 * self.prevNum1 / self.currentNum
                }
            case .divide:
                switch self.operator1 {
                    case .add:
                        self.prevNum1 = self.prevNum2 / self.prevNum1 + self.currentNum
                    case .subtract:
                        self.prevNum1 = self.prevNum2 / self.prevNum1 - self.currentNum
                    case .multiply:
                        self.prevNum1 = self.prevNum2 /
                            self.prevNum1 * self.currentNum
                    case .divide:
                        self.prevNum1 = self.prevNum2 / self.prevNum1 / self.currentNum
                }
            }
            self.currentNum = 0.0
            self.prevNum2 = 0.0
            self.operator2 = Operator.add
            self.done = true
            self.decimalNum = 0
        }
    }
        
        func solveMultiplyDivide() {
        if ((self.currentNum == 0.0 && self.operator1 == Operator.divide) || (self.prevNum1 == 0.0 && self.operator2 == Operator.divide)){
            self.reset()
            self.error = true
        }
        else {
            switch self.operator2 {
            case .add:
                switch self.operator1 {
                    case .add:
                        self.prevNum2 += self.prevNum1
                        self.prevNum1 = self.currentNum
                        self.operator2 = self.operator1
                    case .subtract:
                        self.prevNum2 += self.prevNum1
                        self.prevNum1 = self.currentNum
                        self.operator2 = self.operator1
                    case .multiply:
                        self.prevNum1 *= self.currentNum
                    case .divide:
                        self.prevNum1 /= self.currentNum
                }
            case .subtract:
                switch self.operator1 {
                    case .add:
                        self.prevNum2 = self.prevNum2 - self.prevNum1
                        self.prevNum1 = self.currentNum
                        self.operator2 = self.operator1
                    case .subtract:
                        self.prevNum2 = self.prevNum2 - self.prevNum1
                        self.prevNum1 = self.currentNum
                        self.operator2 = self.operator1
                    case .multiply:
                        self.prevNum1 *= self.currentNum
                    case .divide:
                        self.prevNum1 /= self.currentNum
                }
            case .multiply:
                switch self.operator1 {
                    case .add:
                        self.prevNum2 *= self.prevNum1
                        self.prevNum1 = self.currentNum
                        self.operator2 = self.operator1
                    case .subtract:
                        self.prevNum2 *= self.prevNum1
                        self.prevNum1 = self.currentNum
                        self.operator2 = self.operator1
                    case .multiply:
                        self.prevNum1 *= self.prevNum2 * self.currentNum
                        self.prevNum2 = 0.0
                        self.operator2 = Operator.add
                    case .divide:
                        self.prevNum1 = self.prevNum2 * self.prevNum1 / self.currentNum
                        self.prevNum2 = 0.0
                        self.operator2 = Operator.add
                }
            case .divide:
                switch self.operator1 {
                    case .add:
                        self.prevNum2 /= self.prevNum1
                        self.prevNum1 = self.currentNum
                        self.operator2 = self.operator1
                    case .subtract:
                        self.prevNum1 = self.prevNum2 / self.prevNum1 - self.currentNum
                        self.prevNum1 = self.currentNum
                        self.operator2 = self.operator1
                    case .multiply:
                        self.prevNum1 = self.prevNum2 /
                            self.prevNum1 * self.currentNum
                        self.prevNum2 = 0.0
                        self.operator2 = Operator.add
                    case .divide:
                        self.prevNum1 = self.prevNum2 / self.prevNum1 / self.currentNum
                        self.prevNum2 = 0.0
                        self.operator2 = Operator.add
                }
            }
            self.currentNum = 0.0
            self.done = true
            self.decimalNum = 0
        }
    }
    
    func solveEqual() {
        if ((self.currentNum == 0.0 && self.operator1 == Operator.divide) || (self.prevNum1 == 0.0 && self.operator2 == Operator.divide)){
            self.reset()
            self.error = true
        }
        else {
            switch self.operator2 {
            case .add:
                switch self.operator1 {
                    case .add:
                        self.currentNum += self.prevNum1 + self.prevNum2
                    case .subtract:
                        self.currentNum = self.prevNum2 + self.prevNum1 - self.currentNum
                    case .multiply:
                        self.currentNum = self.prevNum2 + self.prevNum1 * self.currentNum
                    case .divide:
                        self.currentNum = self.prevNum2 + self.prevNum1 / self.currentNum
                }
            case .subtract:
                switch self.operator1 {
                    case .add:
                        self.currentNum = self.prevNum2 - self.prevNum1 + self.currentNum
                    case .subtract:
                        self.currentNum = self.prevNum2 - self.prevNum1 - self.currentNum
                    case .multiply:
                        self.currentNum = self.prevNum2 - self.prevNum1 * self.currentNum
                    case .divide:
                        self.currentNum = self.prevNum2 - self.prevNum1 / self.currentNum
                }
            case .multiply:
                switch self.operator1 {
                    case .add:
                        self.currentNum = self.prevNum2 * self.prevNum1 + self.currentNum
                    case .subtract:
                        self.currentNum = self.prevNum2 * self.prevNum1 - self.currentNum
                    case .multiply:
                        self.currentNum *= self.prevNum1 * self.prevNum2
                    case .divide:
                        self.currentNum = self.prevNum2 * self.prevNum1 / self.currentNum
                }
            case .divide:
                switch self.operator1 {
                    case .add:
                        self.currentNum = self.prevNum2 / self.prevNum1 + self.currentNum
                    case .subtract:
                        self.currentNum = self.prevNum2 / self.prevNum1 - self.currentNum
                    case .multiply:
                        self.currentNum = self.prevNum2 /
                            self.prevNum1 * self.currentNum
                    case .divide:
                        self.currentNum = self.prevNum2 / self.prevNum1 / self.currentNum
                }
            }
            self.prevNum1 = 0.0
            self.prevNum2 = 0.0
            self.operator2 = Operator.add
            self.done = false
            self.decimalNum = 0
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
