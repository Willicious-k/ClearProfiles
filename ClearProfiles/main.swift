//
//  main.swift
//  ClearProfiles
//
//  Created by seongjong_kim on 2020/01/09.
//  Copyright © 2020 williciousk. All rights reserved.
//

import Foundation

let targetPathString = "/Library/MobileDevice/Provisioning Profiles/"
let homePath = NSHomeDirectory()
let targetPath = homePath + targetPathString
print("Your provision folder: \(targetPath)")

guard let provisionFiles = try? FileManager.default.contentsOfDirectory(atPath: targetPath) else { exit(0) }
print("Found \(provisionFiles.count) items")

provisionFiles.forEach { fileName in
    do {
        print("Deleting \(fileName)")
        try FileManager.default.removeItem(atPath: targetPath + fileName)
    } catch let error {
        print(error.localizedDescription)
    }
}
print("Done")
