//
//  dataSet.swift
//  00757128_hw3
//
//  Created by User18 on 2020/10/24.
//

import Foundation;
import SwiftUI;

var districts = [" ","仁愛區","中正區","中山區","安樂區"]

struct tourAttrac {
    let name : String
    let relaxSca : CGFloat
    let info : String
}

struct coordinateOfDist {
    let lati : Double
    let longi : Double
}

let dataCoordinateOfDist = [coordinateOfDist(lati: 25.1284038, longi: 121.7396850),coordinateOfDist(lati: 25.1284038, longi: 121.7396850),coordinateOfDist(lati: 25.1489988, longi: 121.7736823),coordinateOfDist(lati: 25.1525870, longi: 121.7252457),coordinateOfDist(lati: 25.1474144, longi: 121.7024448)]

let attractionsOfRA = [tourAttrac(name: "獅球嶺觀景台", relaxSca: 0, info:"想一覽基隆市區的美景嗎？獅球嶺觀景台絕對是最棒的選擇！但小心～爬上這個觀景台可是不輕鬆的呢！"), tourAttrac(name: "廟口夜市", relaxSca: 3, info: "基隆最有名的莫過於廟口夜市了！肚子餓了趕快來這裡覓食～"), tourAttrac(name: "海洋廣場", relaxSca: 3, info: "位於基隆港南岸的海洋廣場，不時都能在這裡欣賞停靠中的國際郵輪呢！")]

let attractionsOfZZ = [tourAttrac(name: "八斗子車站", relaxSca: 3, info:  "來到八斗子車站就可感受海景配火車的滋味，一出站就立即看到壯觀的海景，彷彿到達另一個仙境。"),tourAttrac(name: "八斗子潮境公園", relaxSca: 3, info: "原是垃圾掩埋場的潮境公園，現在可是看海的好去處呢！"),tourAttrac(name: "正濱漁港", relaxSca: 3, info: "熱門的彩虹屋就在正濱漁港等你來打卡！"),tourAttrac(name: "忘憂谷", relaxSca: 2, info: "賞海的好去處，在這裡好好放鬆，把憂都忘掉吧！"),tourAttrac(name: "和平島公園", relaxSca: 2, info: "和平島公園位於基隆港港口東側，島上奇岩異石林立，也有奇特的海蝕地形景觀"),tourAttrac(name: "社寮東砲台", relaxSca: 1, info: "位於和平島上的秘境，雖然擁有絕佳的海景視野，但可要小心這裡很多蚊子！"),tourAttrac(name: "長潭漁港", relaxSca: 3, info: "長潭里漁港為基隆市七個漁港之一與望海巷漁港相距不遠。過去八斗子是一個島嶼，島與陸地間是一個狹長的水道，稱為「長潭」"),tourAttrac(name: "龍崗步道", relaxSca: 0, info: "出入口位於海大校園內，是假日踏青爬山的好去處～"),tourAttrac(name: "中正公園", relaxSca: 1, info: "公園的最高點，有一座白色的觀音大佛像，22.5公尺高的觀音塑像內分五層，可登上鳥瞰基隆全景")]

let attractionsOfZS = [tourAttrac(name: "外木山海興步道", relaxSca: 0, info: "從外木山的海邊可以一路沿著步道來到山上的情人湖，但步道有一點抖，爬上山也是會有點累唷～"),tourAttrac(name: "白米甕砲台", relaxSca: 2, info: "基隆著名的砲台景點，擁有絕佳的海景視野～"), tourAttrac(name: "地標公園", relaxSca: 2, info: "想俯瞰基隆港，來這準沒錯！"), tourAttrac(name: "情人湖濱海大道", relaxSca: 3, info: "沿著外木山的海邊散步，多麽愜意啊～")]

let attractionsOfAL = [tourAttrac(name: "大武崙沙灘", relaxSca: 3, info: "基隆少見的沙灘海邊，快來玩水！"), tourAttrac(name: "新山水庫", relaxSca: 1, info: "位於新山水庫旁的步道，非常清幽！"), tourAttrac(name: "情人湖公園", relaxSca: 2, info: "情人湖公園位於大武崙山山腰上，由六條山澗匯集而成，是基隆唯一的高地湖泊")]
