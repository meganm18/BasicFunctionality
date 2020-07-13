//
//  ViewController.swift
//  Calculator
//
//

import SwiftUI

struct ViewController: View {
    @State private var currentNum = 0
    @State private var done = false
    @State private var operator1 = "+"
    @State private var prevNum1 = 0
    @State private var operator2 = "+"
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
                    .padding(.all, 40)
                
                Spacer()
                
                //Current Result
                if(done) {
                    Text(String(prevNum1))
                        .padding(.all, 20)
                }
                else{
                    Text(String(currentNum))
                        .padding(.all, 20)
                }
                
                Spacer()
                
                //Buttons
                VStack{
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            //TODO
                        }) {
                            Text("+")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            //TODO
                            }) {
                            Text("-")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            //TODO
                            }) {
                            Text("*")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            //TODO
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
                                //TODO
                                }) {
                    
                                Text("7")
                                    .bold()
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                                //TODO
                                }) {
                                Text("8")
                                    .bold()
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                                //TODO
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
                                //TODO
                                }) {
                    
                                Text("4")
                                    .bold()
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                                //TODO
                                }) {
                                Text("5")
                                    .bold()
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                                //TODO
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
                            //TODO
                            }) {
                
                            Text("1")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            //TODO
                            }) {
                            Text("2")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            //TODO
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
                        
                        Button(action: {
                            //TODO
                            }) {
                
                            Text("0")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        
                        Spacer()
                        
                        Button(action: {
                            //TODO
                            }) {
                            Text(".")
                                .bold()
                                .padding(.all, 20)
                                .foregroundColor(.white)
                                .background(Color.black)
                        }
                        
                        
                        Spacer()
                        
                        Button(action: {
                            //TODO
                            }) {
                            Text("=")
                                .bold()
                                .padding(.all, 20)
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
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
