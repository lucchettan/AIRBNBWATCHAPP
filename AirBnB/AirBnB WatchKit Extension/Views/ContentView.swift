//
//  ContentView.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 09/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var capacity: Int = 1
    var body: some View {
        VStack{
            Image("airbnb")
                .resizable()
                .frame(width: 60, height: 60)
            Text("Welcome to Napoli")
                .font(.footnote)
                .foregroundColor(Color.gray)
            Text("How many are you?")
                .font(.headline)
                .foregroundColor(Color(red: 235/255, green: 102/255, blue: 101/255))
            HStack {
                Button (action: { self.capacity -= 1}){
                    Image(systemName: "minus.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color(red: 235/255, green: 102/255, blue: 101/255))
                }
                .frame(width: 50, height: 50)

                Text(String(self.capacity))
                    .offset(x: -1.5)
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .frame(width: 25)
                    .padding()
                
                Button (action: {self.capacity += 1}){
                    Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color(red: 235/255, green: 102/255, blue: 101/255))
                }
                .frame(width: 50, height: 50)
            }
            .frame(height: 30)
            NavigationLink(destination:  Results(capacity: self.capacity)) {
                ZStack(alignment: .center) {
                    Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color(red: 235/255, green: 102/255, blue: 101/255))
                    Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color.white)
                }
                .offset(y: 12)
            }
            .frame(height: 20)
        }
        .offset(y: -10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
