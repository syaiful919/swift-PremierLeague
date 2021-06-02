//
//  ContentView.swift
//  PremierLeague
//
//  Created by Syaiful Salam on 02/06/21.
//

import SwiftUI

extension Color {
    static let primary = Color("primary")
}

class Json: ObservableObject {
    @Published var json = [ClubModel]()
    
    init() {
        load()
    }
    
    func load(){
        let  path = Bundle.main.path(forResource: "data", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url){
            (data,response,error) in
            do{
                if let data = data{
                    let json = try JSONDecoder().decode([ClubModel].self, from: data)
                    DispatchQueue.main.sync {
                        self.json=json
                    }
                }else{
                    print("no data")
                }
            }catch{
                print(error)
            }
        }.resume()
    }
}

struct HomeView: View {
    @ObservedObject var clubs = Json()
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(clubs.json) { club in
                    ClubCard(data:club)
                }.padding()
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading:
                    HStack{
                        Image("epl_logo_full").resizable().frame(width: 76.0, height: 32.0)
                    }
                
                ,
                trailing:
                    NavigationLink(
                        destination:AboutView()) {
                        Image(systemName: "info.circle.fill")
                    })
        }
        .accentColor(.primary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ClubCard :View{
    let data: ClubModel
    
    var body : some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white).shadow(radius: 1)
            VStack(alignment: .leading){
                HStack{
                    Image(data.emblem).resizable().frame(width: 45.0, height: 45.0)
                    VStack(alignment: .leading){
                        Text(data.name).font(.headline).bold()
                        Text(data.nickname).font(.subheadline).foregroundColor(.gray)
                    }
                }.padding(.bottom, 5)
                Text(data.description).font(.caption).lineLimit(3)
                NavigationLink(
                    destination:DetailView(data: data)) {
                    Text("see details").font(.callout).bold().foregroundColor(.primary).padding(.top, 10).frame(maxWidth: .infinity, alignment: .trailing)
                    
                }
            }.padding(10)
        }
        .padding(5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
