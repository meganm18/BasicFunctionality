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
    @State private var currentNum = 0
    @State private var done = false
    @State private var operator1 = Operator.add
    @State private var prevNum1 = 0
    @State private var operator2 = Operator.add
    @State private var prevNum2 = 0
    @State private var error = false
    
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
                Spacer()
                
                //Title
                Text("Calculator")
                    .bold()
                    .foregroundColor(.white)
                    .scaleEffect(3)
                
                Spacer()
                
                //Current Result
                if(done) {
                    Text(String(prevNum1))
                }
                else{
                    Text(String(currentNum))
                }
                
                Spacer()
                
                //Buttons
                VStack{
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.solve()
                            self.operator1 = Operator.add
                        }) {
                            Text("+")
                                .bold()
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.solve()
                            if(!self.error){
                                self.operator1 = Operator.subtract
                            }
                            }) {
                            Text("-")
                                .bold()
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.solve()
                            if(!self.error){
                                self.operator1 = Operator.multiply
                            }
                            }) {
                            Text("*")
                                .bold()
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.solve()
                            if(!self.error){
                                self.operator1 = Operator.divide
                            }
                            }) {
                            Text("/")
                                .bold()
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    
                    Spacer()

                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.currentNum = self.currentNum * 10 + 7
                            self.error = false
                            self.done = false
                                }) {
                                Text("7")
                                    .bold()
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                                self.currentNum = self.currentNum * 10 + 8
                                self.error = false
                                self.done = false
                                }) {
                                Text("8")
                                    .bold()
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                                self.currentNum = self.currentNum * 10 + 9
                                self.error = false
                                self.done = false
                                }) {
                                Text("9")
                                    .bold()
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                                self.currentNum = self.currentNum * 10 + 4
                                self.error = false
                                self.done = false
                                }) {
                                Text("4")
                                    .bold()
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                                self.currentNum = self.currentNum * 10 + 5
                                self.error = false
                                self.done = false
                                }) {
                                Text("5")
                                    .bold()
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                                self.currentNum = self.currentNum * 10 + 6
                                self.error = false
                                self.done = false
                                }) {
                                Text("6")
                                    .bold()
                                    .padding(.all, 10)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.currentNum = self.currentNum * 10 + 1
                            self.error = false
                            self.done = false
                            }) {
                            Text("1")
                                .bold()
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.currentNum = self.currentNum * 10 + 2
                            self.error = false
                            self.done = false
                            }) {
                            Text("2")
                                .bold()
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.currentNum = self.currentNum * 10 + 3
                            self.error = false
                            self.done = false
                            }) {
                            Text("3")
                                .bold()
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.currentNum = self.currentNum * 10
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
                            //TODO
                            }) {
                            Text(".")
                                .bold()
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        
                        Spacer()
                        
                        Button(action: {
                            self.solve()
                            }) {
                            Text("=")
                                .bold()
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        
                        Spacer()
                        
                    }
                }
                Spacer()
            }
        }
    }
    
    func reset(){
        self.currentNum = 0
        self.prevNum1 = 0
        self.prevNum2 = 0
        self.operator1 = Operator.add
        self.operator2 = Operator.add
    }
    
    func solve() {
        if ((self.currentNum == 0 && self.operator1 == Operator.divide) || (self.prevNum1 == 0 && self.operator2 == Operator.divide)){
            self.error = true
            self.reset()
        }
        else {
            switch self.operator2 {
            case .add:
                switch self.operator1 {
                    case .add:
                        self.prevNum1 += self.prevNum2 + self.currentNum
                        self.prevNum2 = 0
                    case .subtract:
                        self.prevNum1 += self.prevNum2 - self.currentNum
                        self.prevNum2 = 0
                    case .multiply:
                        self.prevNum1 = self.prevNum2 + self.prevNum1 * self.currentNum
                        self.prevNum2 = 0
                    case .divide:
                        self.prevNum1 = self.prevNum2 + self.prevNum1 / self.currentNum
                        self.prevNum2 = 0
                }
            case .subtract:
                switch self.operator1 {
                    case .add:
                        self.prevNum1 = self.prevNum2 - self.prevNum1 + self.currentNum
                        self.prevNum2 = 0
                    case .subtract:
                        self.prevNum1 = self.prevNum2 - self.prevNum1 - self.currentNum
                        self.prevNum2 = 0
                    case .multiply:
                        self.prevNum1 = self.prevNum2 - self.prevNum1 * self.currentNum
                        self.prevNum2 = 0
                    case .divide:
                        self.prevNum1 = self.prevNum2 - self.prevNum1 / self.currentNum
                }
            case .multiply:
                switch self.operator1 {
                    case .add:
                        self.prevNum1 = self.prevNum2 * self.prevNum1 + self.currentNum
                        self.prevNum2 = 0
                    case .subtract:
                        self.prevNum1 = self.prevNum2 * self.prevNum1 - self.currentNum
                        self.prevNum2 = 0
                    case .multiply:
                        self.prevNum1 *= self.prevNum2 * self.currentNum
                        self.prevNum2 = 0
                    case .divide:
                        self.prevNum1 = self.prevNum2 * self.prevNum1 / self.currentNum
                }
            case .divide:
                switch self.operator1 {
                    case .add:
                        self.prevNum1 = self.prevNum2 / self.prevNum1 + self.currentNum
                        self.prevNum2 = 0
                    case .subtract:
                        self.prevNum1 = self.prevNum2 / self.prevNum1 - self.currentNum
                        self.prevNum2 = 0
                    case .multiply:
                        self.prevNum1 = self.prevNum2 /
                            self.prevNum1 * self.currentNum
                        self.prevNum2 = 0
                    case .divide:
                        self.prevNum1 = self.prevNum2 / self.prevNum1 / self.currentNum
                }
            }
            self.currentNum = 0
            self.operator2 = self.operator1
            self.done = true
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
