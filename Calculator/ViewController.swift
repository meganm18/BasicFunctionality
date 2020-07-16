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
                .foregroundColor(.blue)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 135))
                .edgesIgnoringSafeArea(.all)
            
            //Content
            VStack {
                //Spacer()
                
                //Title
                Text("Calculator")
                    .bold()
                    .foregroundColor(.white)
                    .scaleEffect(3)
                    .padding(.all, 40)
                
                Spacer()
                
                
                // FOR TESTING PURPOSES
                Text("self.prevNum2: " + String(self.prevNum2))
                if(self.operator2 == Operator.add){
                    Text("self.operator2: Add")
                }
                else if(self.operator2 == Operator.subtract){
                    Text("self.operator2: Subtract")
                }
                else if(self.operator2 == Operator.multiply){
                    Text("self.operator2: Multiply")
                }
                else{
                    Text("self.operator2: Divide")
                }
                Text("self.prevNum1: " + String(self.prevNum1))
                if(self.operator1 == Operator.add){
                    Text("self.operator1: Add")
                }
                else if(self.operator1 == Operator.subtract){
                    Text("self.operator1: Subtract")
                }
                else if(self.operator1 == Operator.multiply){
                    Text("self.operator1: Multiply")
                }
                else{
                    Text("self.operator2: Divide")
                }
                Text("self.currentNum: " + String(self.currentNum))
                
                //Current Result
                if(self.done) {
                    if(self.prevNum2 == 0.0 && (self.operator2 == Operator.add)) {
                        Text(String(self.prevNum1))
                    }
                    else {
                        if(self.operator2 == Operator.add){
                            Text(String(self.prevNum2) + " + " + String(self.prevNum1))
                        }
                        else if(self.operator2 == Operator.subtract){
                            Text(String(self.prevNum2) + " - " + String(self.prevNum1))
                        }
                        else if(self.operator2 == Operator.multiply){
                            Text(String(self.prevNum2) + " * " + String(self.prevNum1))
                        }
                        else{
                            Text(String(self.prevNum2) + " / " + String(self.prevNum1))
                        }
                    }
                }
                else{
                    Text(String(currentNum))
                        .padding(.all, 20)
                }
                
                if(self.error){
                    Text("ERROR: Divide By 0")
                }
                
                //Spacer()
                
                //Buttons
                VStack{
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.solveAddSubtract()
                            self.operator1 = Operator.add
                        }) {
                            Text("+")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.solveAddSubtract()
                            if(!self.error){
                                self.operator1 = Operator.subtract
                            }
                            }) {
                            Text("-")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.solveMultiplyDivide()
                            if(!self.error){
                                self.operator1 = Operator.multiply
                            }
                            }) {
                            Text("*")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.solveMultiplyDivide()
                            if(!self.error){
                                self.operator1 = Operator.divide
                            }
                            }) {
                            Text("/")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    
                    Spacer()

                    HStack {
                        Spacer()
                        
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
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
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
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
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
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
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
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
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
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
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
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
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
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
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
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
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
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
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
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        //Sign Button
                        Button(action: {
                            self.currentNum *= -1
                        }) {
                            Text("+/-")
                            .bold()
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.decimalNum += 1
                            }) {
                            Text(".")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.solveEqual()
                            self.operator1 = Operator.add
                            }) {
                            Text("=")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.reset()
                        }) {
                            Text("Clear")
                            .bold()
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(Color.black)
                        }
                        
                        Spacer()
                    }
                }
               // Spacer()
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
    }
    
    func solveAddSubtract() {
        if ((self.currentNum == 0.0 && self.operator1 == Operator.divide) || (self.prevNum1 == 0.0 && self.operator2 == Operator.divide)){
            self.error = true
            self.reset()
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
            self.error = true
            self.reset()
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
            self.error = true
            self.reset()
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
