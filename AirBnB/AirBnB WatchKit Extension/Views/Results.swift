//
//  Landing.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 10/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct Results: View {
    let capacity : Int

    
    @State var resultat = 0
    
    var body: some View {
        VStack {
            List (StayGetter().filterStays(filter: self.capacity)) { stay in
                if stay.capacity >= self.capacity {
                    NavigationLink (destination: DetailView(stay: stay)) {
                        HStack {
                            VStack (alignment: .trailing) {
                                Text(stay.name)
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color.gray)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(width: 105, height: 20, alignment: .leading)
                                HStack {
                                    Text("$")
                                        .font(.system(size: 10))
                                        .foregroundColor(Color(red: 235/255, green: 102/255, blue: 101/255))
                                        .offset(x: 7)
                                    Text("\(stay.price)")
                                        .font(.system(size: 13))
                                        .bold()
                                        .foregroundColor(Color(red: 235/255, green: 102/255, blue: 101/255))
                                }.offset(x: 10, y: 5)

                            }
                            .padding()
                            
                            Image(stay.pictures[0])
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: 50, height: 55)
                        }
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 170, height: 50)
                        .background(Color.white)
                        .cornerRadius(5)
                    }
                }
            }.listStyle(PlainListStyle())
        }
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results(capacity: 2)
    }
}
