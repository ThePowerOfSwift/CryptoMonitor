//
//  NetworkService.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 13.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import Alamofire_SwiftyJSON
import SwiftyJSON

class NetworkService {
    
    public static var baseURL: String {
        return "https://min-api.cryptocompare.com"       /* prod */
    }
    
    static func request(endpoint: EndpointProtocol, completionHandler: @escaping (DataResponse<JSON>) -> Void){
        if NetworkReachability.isConnectedToNetwork(){
            Alamofire.request(baseURL+endpoint.path, method: endpoint.method, parameters: endpoint.parameters, encoding: URLEncoding.default, headers: nil).responseSwiftyJSON{ dataResponse in
            DispatchQueue.global().async {
                completionHandler(dataResponse)
            }
        }
        } else{
            let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
        
    }
    
    // MARK: Image downloading
    @discardableResult
    func downloadImage(for url: String, completion: @escaping (UIImage) -> Void) -> Request {
        return Alamofire.request(url, method: .get).responseImage { response in
            guard let image = response.result.value else { return }
            completion(image)
            self.cache(image, for: url)
        }
    }
    
    //MARK: = Image Caching (to RAM Memory)
    
    static let imageCache = AutoPurgingImageCache(
        memoryCapacity: UInt64(100*1024*1024),
        preferredMemoryUsageAfterPurge: UInt64(60*1024*1024)
    )
    
    func cache(_ image: Image, for url: String) {
        NetworkService.imageCache.add(image, withIdentifier: url)
    }
    
    func cachedImage(for url: String) -> Image? {
        return NetworkService.imageCache.image(withIdentifier: url)
    }
    
    //MARK: Image Caching (disk Storage)
    
//    func diskImageDownloader() -> ImageDownloader {
//        // 1024 * 1024 = MB
//        let diskCapacity = 150 * 1024 * 1024
//        let diskCache = URLCache(memoryCapacity: 0, diskCapacity: diskCapacity, diskPath: "image_disk_cache")
//        let configuration = URLSessionConfiguration.default
//        configuration.urlCache = diskCache
//        let cacheCapacity = 100 * 1024 * 1024
//        let cachePurgeCapacity = 60 * 1024 * 1024
//        let imageCache: ImageRequestCache = AutoPurgingImageCache(memoryCapacity: UInt64(cacheCapacity), preferredMemoryUsageAfterPurge: UInt64(cachePurgeCapacity))
//        let downloader = ImageDownloader(configuration: configuration, imageCache: imageCache)
//        UIImageView.af_sharedImageDownloader = downloader
//        return downloader
//    }
}
