//
//  ContentView.swift
//  00757128_hw3
//
//  Created by User18 on 2020/10/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var travelTime = Date()
    @State var selectedDist = 0
    @State private var scale: CGFloat = 1
    @State private var remark = true
    @State private var remarkContent = ""
    @State private var bgColor = Color.white
    @State private var showSecondPage = false
    @State private var noSuitable = false
    @State private var showActionSheet = false
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Text("想去哪走走呢，讓我來推薦你行程吧～")
                    Form{
                        DatePicker("出遊時間", selection: $travelTime,in: Date()...,displayedComponents: .date)
                        distPicker(distIndex: $selectedDist)
                        relaxStepper(scaStep: $scale)
                        relaxSlider(scaSlider: $scale)
                        Toggle("需要備註嗎？", isOn: $remark)
                        if remark {
                            VStack(alignment: .leading) {
                                TextField("輸入備註", text: $remarkContent)
                            }
                        }
                        ColorPicker("設定背景主題顏色", selection: $bgColor)
                    }
                    .frame(height: 380)
                    .padding()
                    .cornerRadius(60)
                    
                    Button(action:{
                        if(selectedDist == 0)
                        {
                            noSuitable = true
                        }
                        else if((selectedDist == 1 && scale == 1) || (selectedDist == 1 && scale == 2))
                        {
                            showActionSheet = true
                        }
                        else if(selectedDist == 3 && scale == 1)
                        {
                            showActionSheet = true
                        }
                        else if(selectedDist == 4 && scale == 0)
                        {
                            showActionSheet = true
                        }
                        else
                        {
                            showSecondPage = true
                        }
                    }){Text("確認送出")}
                    .font(.system(size: 28))
                    .foregroundColor(.red)
                    .padding()
                    .actionSheet(isPresented: $showActionSheet) {
                                ActionSheet(title: Text("抱歉><，目前無符合條件的推薦行程"), message: Text("請問您想要？"), buttons: [.default(Text("從選取的行政區中隨機挑選景點")){ showSecondPage = true },    .default(Text("重新修改資料"))])
                            }
                    .sheet(isPresented: $showSecondPage) {
                        secondPage(showSecondPage: self.$showSecondPage, bgColor: self.$bgColor, travelDat: self.$travelTime, dist: self.$selectedDist, relax: self.$scale,rmrk: self.$remark, remarkCont: self.$remarkContent)
                    }
                    .alert(isPresented: $noSuitable) { () -> Alert in
                        return Alert(title: Text("警告"),message: Text("選一下行政區啦><"))
                    }
                    .background(Color.yellow)
                    .cornerRadius(90)
                }
            }
            .navigationTitle(Text("來製作旅遊小卡吧！"))
            .background(Image("homepageImg"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct distPicker: View {
    @Binding var distIndex : Int
    var body: some View {
        Picker(selection: $distIndex, label: Text("選擇行政區")) {
            ForEach(districts.indices) { (index) in
                Text(districts[index])
            }
        }
    }
}

struct relaxStepper: View {
    @Binding var scaStep : CGFloat
    var body: some View {
        Stepper(value: $scaStep, in: 0...3, step: 1) {
            Text("輕鬆程度：\(scaStep, specifier: "%.0f")")
        }
    }
}

struct relaxSlider: View {
    @Binding var scaSlider : CGFloat
    var body: some View {
        Slider(value: $scaSlider, in: 0...3, step: 1, minimumValueLabel: Text("0"), maximumValueLabel: Text("3")) {
            Text("")
        }
    }
}

