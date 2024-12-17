func fetchData(completion: @escaping (Result<[Data], Error>) -> Void) {
    let url = URL(string: "https://api.example.com/data")!
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        guard let data = data else { 
            completion(.failure(NSError(domain: "com.example.app", code: 1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
            return
        }
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            print(jsonData)
            completion(.success([data]))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}