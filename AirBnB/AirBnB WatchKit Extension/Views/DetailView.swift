//
//  DetailView.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 10/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let stay: Stay
    @State var isModal = false
    @State var nightQuantity = 1
    @State var finalPrice = 0
    
    var body: some View {
        ScrollView {
            PicturesView(images: stay.pictures)
                .edgesIgnoringSafeArea(.all)
                .frame(width: 350)
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            VStack (alignment: .center){
                HStack {
                    Text("Bed :").bold().underline()
                    Text(String(stay.bed))
                    Spacer()
                    Text("Capacity :").bold().underline()
                    Text("\(stay.capacity)")
                }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                HStack {
                    VStack {
                        Text("Check :")
                            .bold()
                            .underline()
                            .offset(x: 8)
                    }
                    Spacer()
                    VStack (alignment: .trailing){
                        Text("In \(stay.checkin)")
                            .offset(x: -8)
                        Text("Out \(stay.checkout)")
                            .offset(x: -8)
                    }
                }
                HStack {
                    Text("Night:")
                        .bold()
                        .underline()
                        .foregroundColor(Color.gray)
                    Text("\(stay.price)$")
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(Color(red: 235/255, green: 102/255, blue: 101/255))
                    Spacer()
                }.padding(EdgeInsets(top: -5, leading: 8, bottom: 5, trailing: 0))

                HStack {
                    Spacer()
                    ZStack (alignment: .center){
                        MapView(stay: stay)
                            .scaledToFit()
                            .frame(width: 170, height: 170)
                            .cornerRadius(15)
                    }
                    Spacer()
                }
            }
            .frame(width: 180)
            .font(.system(size: 12))
            
            Text(stay.name)
                .font(.system(size: 13))
                .bold()
                .underline()
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(width: 150, height: 50)
            HStack {
                Button (action: { if self.nightQuantity > 0 {self.nightQuantity -= 1}}){
                    Image(systemName: "minus.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color(red: 235/255, green: 102/255, blue: 101/255))
                        .edgesIgnoringSafeArea(.all)
                }
                .frame(width: 30, height: 20)

                Text(String(self.nightQuantity))
                    .offset(x: -1.5)
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .padding()
                
                Button (action: {self.nightQuantity += 1}){
                    Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color(red: 235/255, green: 102/255, blue: 101/255))
                            .edgesIgnoringSafeArea(.all)
                }
                .frame(width: 30, height: 20)
            }
            .frame(height: 30)
            
            
            HStack {
                Text("$\(stay.price * nightQuantity) for \(nightQuantity) night")
                    .bold()
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)

                if self.nightQuantity > 1 {
                    Text("s")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                        .offset(x: -8)
                }
            }
            .padding()
            .offset(x: 5)

        }
        .foregroundColor(Color.gray)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(stay: StayGetter().getStays()[0])
    }
}
