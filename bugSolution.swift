func fetchData(completion: @escaping (Result<[[String: Any]], Error>) -> Void) {
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
            guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
                completion(.failure(NSError(domain: "com.example.app", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON data"])))
                return
            }
            completion(.success(jsonObject))
        } catch {
            completion(.failure(error))
        }
    }.resume() 
}