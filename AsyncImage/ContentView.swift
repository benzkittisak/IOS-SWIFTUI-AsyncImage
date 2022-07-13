//
//  ContentView.swift
//  AsyncImage
//
//  Created by Kittisak Panluea on 13/7/2565 BE.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func placeHolderModifier() -> some View {
        self
//        จะเห็นว่า swiftUI ยอมให้เราสามารถไปใช้งานโค้ดปรับแต่งของ imageModifier ได้ด้วยเพื่อไม่ต้องให้เรามา
//        เขียนโค้ดใหม่อยู่
            .imageModifier()
            .frame(maxWidth:128)
    }
}

struct ContentView: View {
    
    let imageURL = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
        // MARK: - 1. BASIC
//        AsyncImage(url: URL(string: imageURL))
            
        // MARK: - 2. SCALE
//        3.0 หมายถึง @3X น่ะนะรูปมันจะจิ๋วลง ถ้า 1.0 เลยรูปมันจะเท่าขนาดจริงแบบใหญ่ก็ใหญ่เลย
//        AsyncImage(url: URL(string: imageURL) , scale: 3.0)
        
        // MARK: 3. - PLACEHOLDER
//        กรณีที่แบบว่ารูปยังไม่โหลดขึ้นมาหรือยังโหลดไม่เสร็จ จะให้ใช้รูปอะไรรอก่อน ทำแบบนี้แหละ
        /*
         อย่างที่เห็นว่าทีนี้เราจะมี code ตรงที่
         .resizeable()
         .scaledToFit()
         ซึ่งมันซ้ำกันอยู่ 2 ที่โดยที่ทั้ง 2 ที่นี้มันคือการปรับแต่งรูปเหมือนกัน
         ดังนั้นเพื่อความง่ายของ code เราจะทำการแยกมันออกไปเป็น extension ไปดูโค้ดตรงล่าง
         import swift เอาเด้อ
         */
        
//        AsyncImage(url: URL(string: imageURL) , content: {
//            image in image
//                .imageModifier()
////                .resizable()
////                .scaledToFit()
//        } ,  placeholder: {
//            Image(systemName: "photo.circle.fill")
////                .resizable()
////                .scaledToFit()
////                .frame(maxWidth:128)
//                .placeHolderModifier()
//        }
//                   )
//        .padding(40)
        
    // MARK: - 4. PHASE
        AsyncImage(url: URL(string: imageURL)) {
//            SUCCESS: รูปสามารถโหลดได้สำเร็จ
//            FAILURE : รูปโหลดไม่สำเร็จ
//            EMPTY : พอโหลดเสร็จแต่มันดันไม่มีรูป
            phase in
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fail")
                    .placeHolderModifier()
            } else {
                Image(systemName: "photo.circle.fill").imageModifier()
            }
            
        }
        .padding(40)
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
