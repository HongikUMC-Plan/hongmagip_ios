//
//  meal.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/20.
//

import UIKit

struct MealCategory {
    let name: String
    let restaurants: [Restaurant]
}

class Restaurant {
    let name: String
    var isLiked: Bool = false
    
    init(name: String) {
        self.name = name
    }
}

var categories: [MealCategory] = [
    MealCategory(name: "한식", restaurants: [
        Restaurant(name: "집밥김치찌개"),
        Restaurant(name: "한석화"),
        Restaurant(name: "국시와 가래떡"),
        Restaurant(name: "율촌"),
        Restaurant(name: "제순식당"),
        Restaurant(name: "발바리네"),
        Restaurant(name: "금복식당"),
        Restaurant(name: "후계동"),
        Restaurant(name: "다락투")
    ]),
    MealCategory(name: "중식", restaurants: [
        Restaurant(name: "카이화"),
        Restaurant(name: "명장"),
        Restaurant(name: "향차이"),
        Restaurant(name: "환시앙"),
        Restaurant(name: "손오공마라탕"),
        Restaurant(name: "타오마라탕"),
        Restaurant(name: "짬뽕지존"),
        Restaurant(name: "샤오바오"),
        Restaurant(name: "신주양꼬치")
    ]),
    MealCategory(name: "일식", restaurants: [
        Restaurant(name: "소코아"),
        Restaurant(name: "카미야"),
        Restaurant(name: "겐로쿠우동"),
        Restaurant(name: "칸다소바"),
        Restaurant(name: "유익상스시"),
        Restaurant(name: "카츠업"),
        Restaurant(name: "히메시야"),
        Restaurant(name: "멘타카무쇼"),
        Restaurant(name: "라멘트럭")
    ]),
    MealCategory(name: "양식", restaurants: [
        Restaurant(name: "아티장 깔조네"),
        Restaurant(name: "필동함박"),
        Restaurant(name: "바리"),
        Restaurant(name: "봉대박파스타"),
        Restaurant(name: "롤링파스타"),
        Restaurant(name: "진짜파스타"),
        Restaurant(name: "이양권반상"),
        Restaurant(name: "윤씨밀방"),
        Restaurant(name: "비스트로주라")
    ]),
    
    MealCategory(name: "홍익대 맛집", restaurants: [
//            Restaurant(name: ""),
//            Restaurant(name: ""),
//            Restaurant(name: ""),
//            Restaurant(name: ""),
//            Restaurant(name: ""),
//            Restaurant(name: ""),
//            Restaurant(name: ""),
//            Restaurant(name: ""),
//            Restaurant(name: "")
        ]),
    
    MealCategory(name: "아시안", restaurants: [
        Restaurant(name: "포보"),
        Restaurant(name: "꼬이"),
        Restaurant(name: "미분당"),
        Restaurant(name: "더 키친 아시아 인도"),
        Restaurant(name: "델리인디아"),
        Restaurant(name: "산띠"),
        Restaurant(name: "1976샤브샤브"),
        Restaurant(name: "침사추이누들"),
        Restaurant(name: "에이시안")
    ]),
    MealCategory(name: "페·푸", restaurants: [
        Restaurant(name: "스매쉬보이"),
        Restaurant(name: "식스티즈"),
        Restaurant(name: "서브웨이"),
        Restaurant(name: "테이스티버거"),
        Restaurant(name: "버거스올마이티"),
        Restaurant(name: "맘스터치"),
        Restaurant(name: "버거킹"),
        Restaurant(name: "더 피자 보이즈"),
        Restaurant(name: "에그드랍")
    ]),
    MealCategory(name: "분식", restaurants: [
        Restaurant(name: "또보겠지"),
        Restaurant(name: "삼청당"),
        Restaurant(name: "삭"),
        Restaurant(name: "봉봉"),
        Restaurant(name: "그동네떡볶이"),
        Restaurant(name: "김가네"),
        Restaurant(name: "오늘타코"),
        Restaurant(name: "지지고"),
        Restaurant(name: "무궁화타운")
    ]),
    MealCategory(name: "기타", restaurants: [
        Restaurant(name: "더그리니치"),
        Restaurant(name: "샌디 빌리지"),
        Restaurant(name: "구스토타코"),
        Restaurant(name: "도시락집 미미"),
        Restaurant(name: "긴자료코"),
        Restaurant(name: "상수 냉장고"),
        Restaurant(name: "무쇠김치삼겹살"),
        Restaurant(name: "넙딱집"),
        Restaurant(name: "등촌")
    ])
]

func getRandomRestaurant() -> Restaurant? {
    guard let randomCategory = categories.randomElement() else {
        return nil
    }
    
    guard let randomRestaurant = randomCategory.restaurants.randomElement() else {
        return nil
    }
    
    return randomRestaurant
}
