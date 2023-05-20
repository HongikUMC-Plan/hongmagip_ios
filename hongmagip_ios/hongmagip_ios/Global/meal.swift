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

let categories: [MealCategory] = [
    MealCategory(name: "한식", restaurants: [
        Restaurant(name: "식당1"),
        Restaurant(name: "식당2"),
        Restaurant(name: "식당3"),
        Restaurant(name: "식당4"),
        Restaurant(name: "식당5"),
        Restaurant(name: "식당6"),
        Restaurant(name: "식당7"),
        Restaurant(name: "식당8"),
        Restaurant(name: "식당9")
    ]),
    MealCategory(name: "중식", restaurants: [
        Restaurant(name: "식당1"),
        Restaurant(name: "식당2"),
        Restaurant(name: "식당3"),
        Restaurant(name: "식당4"),
        Restaurant(name: "식당5"),
        Restaurant(name: "식당6"),
        Restaurant(name: "식당7"),
        Restaurant(name: "식당8"),
        Restaurant(name: "식당9")
    ]),
    MealCategory(name: "일식", restaurants: [
        Restaurant(name: "식당1"),
        Restaurant(name: "식당2"),
        Restaurant(name: "식당3"),
        Restaurant(name: "식당4"),
        Restaurant(name: "식당5"),
        Restaurant(name: "식당6"),
        Restaurant(name: "식당7"),
        Restaurant(name: "식당8"),
        Restaurant(name: "식당9")
    ]),
    MealCategory(name: "양식", restaurants: [
        Restaurant(name: "식당1"),
        Restaurant(name: "식당2"),
        Restaurant(name: "식당3"),
        Restaurant(name: "식당4"),
        Restaurant(name: "식당5"),
        Restaurant(name: "식당6"),
        Restaurant(name: "식당7"),
        Restaurant(name: "식당8"),
        Restaurant(name: "식당9")
    ]),
    MealCategory(name: "홍익대 맛집", restaurants: [
        Restaurant(name: "식당1"),
        Restaurant(name: "식당2"),
        Restaurant(name: "식당3"),
        Restaurant(name: "식당4"),
        Restaurant(name: "식당5"),
        Restaurant(name: "식당6"),
        Restaurant(name: "식당7"),
        Restaurant(name: "식당8"),
        Restaurant(name: "식당9")
    ]),
    MealCategory(name: "아시안", restaurants: [
        Restaurant(name: "식당1"),
        Restaurant(name: "식당2"),
        Restaurant(name: "식당3"),
        Restaurant(name: "식당4"),
        Restaurant(name: "식당5"),
        Restaurant(name: "식당6"),
        Restaurant(name: "식당7"),
        Restaurant(name: "식당8"),
        Restaurant(name: "식당9")
    ]),
    MealCategory(name: "페·푸", restaurants: [
        Restaurant(name: "햄버거"),
        Restaurant(name: "피자"),
        Restaurant(name: "식당3"),
        Restaurant(name: "식당4"),
        Restaurant(name: "식당5"),
        Restaurant(name: "식당6"),
        Restaurant(name: "식당7"),
        Restaurant(name: "식당8"),
        Restaurant(name: "식당9")
    ]),
    MealCategory(name: "분식", restaurants: [
        Restaurant(name: "식당1"),
        Restaurant(name: "식당2"),
        Restaurant(name: "식당3"),
        Restaurant(name: "식당4"),
        Restaurant(name: "식당5"),
        Restaurant(name: "식당6"),
        Restaurant(name: "식당7"),
        Restaurant(name: "식당8"),
        Restaurant(name: "식당9")
    ]),
    MealCategory(name: "기타", restaurants: [
        Restaurant(name: "식당1"),
        Restaurant(name: "식당2"),
        Restaurant(name: "식당3"),
        Restaurant(name: "식당4"),
        Restaurant(name: "식당5"),
        Restaurant(name: "식당6"),
        Restaurant(name: "식당7"),
        Restaurant(name: "식당8"),
        Restaurant(name: "식당9")
    ]),
    
    
    
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
