//
//  DataBaseManager.swift
//  AppBlog
//
//  Created by Filipe Boeck on 22/06/23.
//

import Foundation
import FirebaseFirestore

final class DataBaseManager {
    static let shared = DataBaseManager()
    
    private let dataBase = Firestore.firestore()
    
    private init() {}
    
    public func insertPost(
        blogPost: BlogPost,
        email: String,
        completion: @escaping (Bool) -> Void
    ) {
        let userEmail = email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        let data: [String: Any] = [
            "id": blogPost.identifier,
            "title": blogPost.title,
            "body": blogPost.text,
            "created": blogPost.timeStamp,
            "headerImageUrl": blogPost.headerImageUrl?.absoluteString ?? ""
        ]
        
        dataBase
            .collection("users")
            .document(userEmail)
            .collection("posts")
            .document(blogPost.identifier)
            .setData(data) { error in
                completion(error == nil)
            }
    }
    
    public func getPosts(for email: String, completion: @escaping ([BlogPost]) -> Void) {
        let userEmail = email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        dataBase
            .collection("users")
            .document(userEmail)
            .collection("posts")
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents.compactMap ({ $0.data() }),
                      error == nil else {
                    return
                }
                
                let posts: [BlogPost] = documents.compactMap({ dictionary in
                    guard let id = dictionary["id"] as? String,
                          let title = dictionary["title"] as? String,
                          let body = dictionary["body"] as? String,
                          let created = dictionary["created"] as? TimeInterval,
                          let imageUrlString = dictionary["headerImageUrl"] as? String else {
                        return nil
                    }
                    
                    let post = BlogPost(
                        identifier: id,
                        title: title,
                        timeStamp: created,
                        headerImageUrl: URL(string: imageUrlString),
                        text: body
                    )
                    return post
                })
                completion(posts)
            }
    }
    
    public func getAllPosts(completion: @escaping ([BlogPost]) -> Void) {
        
        dataBase
            .collection("users")
            .getDocuments { [weak self] snapshot, error in
                guard let documents = snapshot?.documents.compactMap({ $0.data() }),
                      error == nil else {
                    return
                }
                
                let emails: [String] = documents.compactMap({ $0["email"] as? String })
                guard !emails.isEmpty else {
                    completion([])
                    return
                }
                
                let group = DispatchGroup()
                var result: [BlogPost] = []
                
                for email in emails {
                    group.enter()
                    self?.getPosts(for: email) { userPosts in
                        defer {
                            group.leave()
                        }
                        result.append(contentsOf: userPosts)
                    }
                }
                group.notify(queue: .global()) {
                    completion(result)
                }
            }
    }
    
    public func insertUser(user: User, completion: @escaping (Bool) -> Void) {
        let documentId = user.email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        let data = [
            "email": user.email,
            "name": user.name
        ]
        dataBase
            .collection("users")
            .document(documentId)
            .setData(data) { error in
                completion(error == nil)
            }
    }
    
    public func getUser(email: String, completion: @escaping (User?) -> Void) {
        let documentId = email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        dataBase
            .collection("users")
            .document(documentId)
            .getDocument { snapshot, error in
                guard let data = snapshot?.data() as? [String: String],
                      let name = data["name"],
                      error == nil else {
                    return
                }
                
                let ref = data["profile_photo"]
                let user = User(name: name, email: email, profilePictureRef: ref)
                completion(user)
            }
    }
    
    func updateProfilePhoto(email: String, completion: @escaping (Bool) -> Void) {
        let path = email
            .replacingOccurrences(of: "@", with: "_")
            .replacingOccurrences(of: ".", with: "_")
        
        let photoReference = "profile_pictures/\(path)/photo.png"
        
        let dbRef = dataBase
            .collection("users")
            .document(path)
        
        dbRef.getDocument { snapshot, error in
            guard var data = snapshot?.data(), error == nil else {
                return
            }
            data["profile_photo"] = photoReference
            
            dbRef.setData(data) { error in
                completion(error == nil)
            }
        }
    }
}
