//
//  Data.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/20.
//


import UIKit

class FetchData {
    
    func fetchData() {
        
        // 네이버 API 요청 URL
        let urlString = "https://openapi.naver.com/v1/search/blog?query=아이폰"
        
        // URL 객체 생성
        guard let url = URL(string: urlString) else {
            // 잘못된 URL 처리
            return
        }
        
        // URLRequest 생성
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // 네이버 API 인증 정보 설정
        let clientID = "S8xGIeLVhsPtgrtBZ5W1"
        let clientSecret = "tgsufcZj64"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        // API 호출 및 응답 처리
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // 네트워크 에러 처리
                print("네트워크 에러:", error.localizedDescription)
                return
            }
            
            guard let data = data else {
                // 잘못된 응답 데이터 처리
                print("잘못된 응답 데이터")
                return
            }
            
            // JSON 파싱
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    // 잘못된 JSON 형식 처리
                    print("잘못된 JSON 형식")
                    return
                }
                
                // 'items' 배열 추출
                guard let items = json["items"] as? [[String: Any]] else {
                    // 'items' 배열이 없거나 잘못된 형식인 경우 처리
                    print("'items' 배열이 없거나 잘못된 형식")
                    return
                }
                
                // 블로그 데이터 파싱
                var blogs: [Blog] = []
                
                for item in items {
                    if let title = item["title"] as? String,
                       let link = item["link"] as? String,
                       let bloggername = item["bloggername"] as? String,
                       let description = item["description"] as? String
                    {
                        let blog = Blog(title: title, link: link, description:description, bloggername: bloggername)
                        blogs.append(blog)
                    }
                }
                
                // 파싱된 데이터 활용
                print("블로그 데이터:", blogs)
            } catch {
                // 파싱 에러 처리
                print("파싱 에러:", error.localizedDescription)
            }
        }
        
        // API 호출 시작
        task.resume()
        
    }

    
}
