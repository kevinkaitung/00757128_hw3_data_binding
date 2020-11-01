//
//  secondPage.swift
//  00757128_hw3
//
//  Created by User18 on 2020/10/28.
//

import SwiftUI
import MapKit

struct secondPage: View {
    @Binding var showSecondPage: Bool
    @Binding var bgColor: Color
    @Binding var travelDat: Date
    @Binding var dist: Int
    @Binding var relax: CGFloat
    @Binding var rmrk: Bool
    @Binding var remarkCont: String
    @State private var showMap = false
    
    var body: some View {
        if showMap == true{
            VStack {
                MapView(coordinate: CLLocationCoordinate2DMake(dataCoordinateOfDist[dist].lati, dataCoordinateOfDist[dist].longi))
                Button("返回") {
                    showMap = false
                }
                .font(.system(size: 20))
                .foregroundColor(.red)
                .padding()
                .background(Color.yellow)
                .cornerRadius(90)
            }
        }
        else{
            VStack {
                Spacer()
                Text("這是您的旅遊小卡")
                    .font(.title2)
                    .padding()
                    .background(Color(red: 144/255, green: 238/255, blue: 144/255, opacity: 0.7))
                    .cornerRadius(30)
                //.frame( width:180,height:50)
                List{
                    HStack{
                        Text("出遊日期：")
                        Text(travelDat, style: .date)
                    }
                    HStack{
                        Text("想前往的行政區：" + districts[dist])
                            .contextMenu {
                                Button(action: {
                                    showMap = true
                                }) {
                                    Text("看地圖")
                                    Image(systemName: "map")
                                }
                            }
                    }
                    HStack{
                        Text("輕鬆程度：")
                        Text("\(relax, specifier: "%.0f")")
                    }
                    if rmrk {
                        HStack{
                            Text("備註：")
                            Text(remarkCont)
                        }
                    }
                    VStack{
                        let pick = self.choose(districtName: dist, relaxScale: relax)
                        if(dist == 1)
                        {
                            Text(attractionsOfRA[pick].name)
                                .font(.system(size: 20))
                                .padding(/*@START_MENU_TOKEN@*/.top, 10.0/*@END_MENU_TOKEN@*/)
                            Image(attractionsOfRA[pick].name).resizable().scaledToFill().frame(width: 260, height: 180, alignment: .center).clipped()
                                .cornerRadius(30)
                            Text(attractionsOfRA[pick].info).padding()
                        }
                        else if(dist == 2)
                        {
                            Text(attractionsOfZZ[pick].name)
                                .font(.system(size: 20))
                                .padding(/*@START_MENU_TOKEN@*/.top, 10.0/*@END_MENU_TOKEN@*/)
                            Image(attractionsOfZZ[pick].name).resizable().scaledToFill().frame(width: 260, height: 180, alignment: .center).clipped()
                                .cornerRadius(30)
                            Text(attractionsOfZZ[pick].info).padding()
                        }
                        else if(dist == 3)
                        {
                            Text(attractionsOfZS[pick].name)
                                .font(.system(size: 20))
                                .padding(/*@START_MENU_TOKEN@*/.top, 10.0/*@END_MENU_TOKEN@*/)
                            Image(attractionsOfZS[pick].name).resizable().scaledToFill().frame(width: 260, height: 180, alignment: .center).clipped()
                                .cornerRadius(30)
                            Text(attractionsOfZS[pick].info).padding()
                        }
                        else if(dist == 4)
                        {
                            Text(attractionsOfAL[pick].name)
                                .font(.system(size: 20))
                                .padding(/*@START_MENU_TOKEN@*/.top, 10.0/*@END_MENU_TOKEN@*/)
                            Image(attractionsOfAL[pick].name).resizable().scaledToFill().frame(width: 260, height: 180, alignment: .center).clipped()
                                .cornerRadius(30)
                            Text(attractionsOfAL[pick].info).padding()
                        }
                        
                        //Spacer()
                    }
                    .background(bgColor)
                    .cornerRadius(30)
                    .padding()
                    MoreView(dist: dist)
                }
                //.frame(height: 200)
                Button("返回") {
                    showSecondPage = false
                }
                .font(.system(size: 20))
                .foregroundColor(.red)
                .padding()
                .background(Color.yellow)
                .cornerRadius(90)
                
            }
        }
    }
    
    
    
    func choose(districtName: Int, relaxScale: CGFloat) -> Int {
        var randNum : Int
        var tmp: [Int] = [0,0,0,0,0,0,0]
        var tmpIndex : Int = 0
        if districtName == 1{
            for i in 0 ..< attractionsOfRA.count {
                if attractionsOfRA[i].relaxSca == relaxScale {
                    tmp[tmpIndex] = i
                    tmpIndex += 1
                }
            }
            if tmpIndex == 0 {
                randNum = Int.random(in: 0..<attractionsOfRA.count)
                return randNum
            }
            else {
                randNum = Int.random(in: 0..<tmpIndex)
                return tmp[randNum]
            }
        }
        else if districtName == 2{
            for i in 0 ..< attractionsOfZZ.count {
                if attractionsOfZZ[i].relaxSca == relaxScale {
                    tmp[tmpIndex] = i
                    tmpIndex += 1
                }
            }
            if tmpIndex == 0 {
                randNum = Int.random(in: 0..<attractionsOfZZ.count)
                return randNum
            }
            else {
                randNum = Int.random(in: 0..<tmpIndex)
                return tmp[randNum]
            }
        }
        else if districtName == 3{
            for i in 0 ..< attractionsOfZS.count {
                if attractionsOfZS[i].relaxSca == relaxScale {
                    tmp[tmpIndex] = i
                    tmpIndex += 1
                }
            }
            if tmpIndex == 0 {
                randNum = Int.random(in: 0..<attractionsOfZS.count)
                return randNum
            }
            else {
                randNum = Int.random(in: 0..<tmpIndex)
                return tmp[randNum]
            }
        }
        else if districtName == 4{
            for i in 0 ..< attractionsOfAL.count {
                if attractionsOfAL[i].relaxSca == relaxScale {
                    tmp[tmpIndex] = i
                    tmpIndex += 1
                }
            }
            if tmpIndex == 0 {
                randNum = Int.random(in: 0..<attractionsOfAL.count)
                return randNum
            }
            else {
                randNum = Int.random(in: 0..<tmpIndex)
                return tmp[randNum]
            }
        }
        return 0
    }
    
}

struct MoreView: View {
    var dist : Int
    var body : some View{
        if(dist == 1)
        {
            return DisclosureGroup("更多仁愛區的景點") {
                VStack(alignment: .leading) {
                    ForEach(attractionsOfRA.indices) { (index) in
                        Text(attractionsOfRA[index].name)
                    }
                }
            }
        }
        else if(dist == 2)
        {
            return DisclosureGroup("更多中正區的景點") {
                VStack(alignment: .leading) {
                    ForEach(attractionsOfZZ.indices) { (index) in
                        Text(attractionsOfZZ[index].name)
                    }
                }
            }
        }
        else if(dist == 3)
        {
            return DisclosureGroup("更多中山區的景點") {
                VStack(alignment: .leading) {
                    ForEach(attractionsOfZS.indices) { (index) in
                        Text(attractionsOfZS[index].name)
                    }
                }
            }
        }
        else
        {
            return DisclosureGroup("更多安樂區的景點") {
                VStack(alignment: .leading) {
                    ForEach(attractionsOfAL.indices) { (index) in
                        Text(attractionsOfAL[index].name)
                    }
                }
            }
        }
    }
}


/*struct secondPage_Previews: PreviewProvider {
 static var previews: some View {
 secondPage(showSecondPage: .constant(true), bgColor: Color.gray,travelDat: Date(timeIntervalSinceNow: 0), dist: $dist, relax: 3,rmrk: .constant(true), remarkCont: "thanks")
 }
 }*/
