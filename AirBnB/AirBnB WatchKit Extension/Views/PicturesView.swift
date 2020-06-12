//
//  PicturesView.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 12/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct PicturesView: View {
    var images: [String]
    @State var dragingValue = CGSize.zero
    var first = 1
    var middle = 2
    var last = 3
    var body: some View {
// ----We declare our Image horizontally------------------------------------------------------------------------------------------------------------------
        HStack {
            Image(images[0])
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(15)

            Spacer()
            Image(images[1])
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                .padding(EdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 17))
            Spacer()
            Image(images[2])
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(15)
        }
        .background(Color.clear)
        .frame(width: 300, height: 100)
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
            
//-----We declare the gesture reader; it will start moving the image, but will finish the gesture if the draging.value.width is big enough-----------------------------------
        .gesture(DragGesture()
            .onChanged { value in
                    self.dragingValue = value.translation
                }
            .onEnded { value in
                if self.dragingValue.width < 45 && self.dragingValue.width > -45 {
                    self.dragingValue =  CGSize.zero
                } else if self.dragingValue.width < -45 {
                    self.dragingValue.width = -125
                } else if self.dragingValue.width > 45 {
                    self.dragingValue.width = 125
                }
            }
        )
        .offset(x: self.dragingValue.width)
        .animation(.spring())
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------

            
            
// -----We set the mask: we will the only through the form/text that we will declare----------------------------------------------------------------------------
        .mask(
            HStack {
                Rectangle()
                    .frame(width: 75, height: 75)
                    .cornerRadius(15)
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                Spacer()
                Rectangle()
                    .frame(width: 75, height: 75)
                    .cornerRadius(15)
            }
        )
//----------------------------------------------------------------------------------------------------------------------------------------------------------------
    }
}

struct PicturesView_Previews: PreviewProvider {
    static var previews: some View {
        PicturesView(images: StayGetter().getStays()[0].pictures )
    }
}
