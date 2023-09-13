//
//  logInService.swift
//  AppFitnexUsingSwiftUI
//
//  Created by JonathanA on 06/09/23.
//

import Foundation

class LogInService {
    
//    func getUser(data: Data?, response: URLResponse?) -> TokenModel? {
//        guard
//            let data = data,
//            let tokens = try? JSONDecoder().decode(TokenModel.self, from: data),
//            let response = response as? HTTPURLResponse,
//            response.statusCode >= 200 && response.statusCode < 300 else {
//            return nil
//        }
//        return tokens
//    }
    
    func getUserOfService(credencial: Credential, handler: @escaping (Result<TokenModel, APIError>) -> Void) {
        
        var result: Result<TokenModel, APIError>
        
        guard let jsonEncode = try? JSONEncoder().encode(credencial) else {
            result = .failure(APIError.badCoding)
            handler(result)
            return
        }
        
        guard let url = URL(string: "http://192.168.1.88:3000/auth/token") else {
            result = .failure(APIError.badURL)
            handler(result)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonEncode
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result:  Result<TokenModel, APIError>
            
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            if response.statusCode == 400 {
                result = .failure(APIError.badRequest)
                handler(result)
            } else if response.statusCode == 401 {
                result = .failure(APIError.NotAuthorized)
                handler(result)
            }
            
            do {
                let token = try JSONDecoder().decode(TokenModel.self, from: data)
                result = .success(token)
                handler(result)
            } catch {
                print("\(error)")
                result = .failure(.badDecoude)
                handler(result)
            }
            
        }.resume()
    }
}
