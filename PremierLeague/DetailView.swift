//
//  DetailView.swift
//  PremierLeague
//
//  Created by Syaiful Salam on 02/06/21.
//

import SwiftUI

struct DetailView: View {
    let data: ClubModel
    
    var body: some View {
        ScrollView(){
            ZStack(alignment: .bottom){
                Rectangle().fill(Color.white).frame(width: UIScreen.main.bounds.size.width, height: 450)
                Image(data.stadiumBg).scaledToFill().frame(width: UIScreen.main.bounds.size.width, height: 250.0).padding(.bottom,200)
                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.white).frame(width: UIScreen.main.bounds.size.width, height: 100).offset(y:-100)
                ZStack{
                    Circle()
                        .fill(Color.white)
                        .frame(width: 120, height: 120)
                    Image(data.emblem).resizable().padding().frame(width: 110, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.offset(y:-130)
                VStack{
                    Text(data.name).font(.largeTitle).bold().padding(.bottom,5)
                    HStack{
                        Image(systemName: "bookmark.circle.fill")
                        Text(data.stadiumName).font(.headline)
                    }
                    .padding(.bottom,5)
                    Text("Since \(data.formed)").font(.subheadline)
                        .padding(.bottom,15)
                }
                
            }
            VStack{
                HStack{
                    Text("Description").font(.headline).bold().padding(.bottom)
                    Spacer()
                }
                
                Text(data.description).font(.caption)
            }.padding(.horizontal)
            
        }
    }
}

