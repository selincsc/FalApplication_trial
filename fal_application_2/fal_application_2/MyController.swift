//
//  MyController.swift
//  app5-windows
//
//  Created by Selin Çağlar on 27.01.2022.
//

import UIKit
import Kingfisher

class MyController: UIViewController {
    
    func Url_To_Image(url : String , imageView : AnimatedImageView, contentScaleMode : UIView.ContentMode =                 UIView.ContentMode.scaleAspectFit){
            
            imageView.contentMode = contentScaleMode
            let url = URL(string: url)
            imageView.kf.setImage(with: url)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func showVC(identifierName: String, StoryBoardName : String  = "Main", animated : Bool = true, presentationStyle : Bool = true ) {
        
        let newViewController = UIStoryboard(name: StoryBoardName, bundle: nil).instantiateViewController(withIdentifier: identifierName)
        // MARK: V0.0.4 EKLENDİ
        if presentationStyle {
            newViewController.modalPresentationStyle = .fullScreen
        }
        
        UIApplication.topViewController()?.present(newViewController, animated: animated, completion: nil)
        
    }
    
    func messageBox(title: String, message: String, buttonTitle : String = "Tamam" , identifierName: String = "", StoryBoardName : String  = "Main" , animated : Bool = true, isDismiss : Bool = false){
        
        let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { (action: UIAlertAction!) in
            
            if isDismiss == true{
                self.dismiss(animated: false)
            }else if(identifierName != ""){
                self.showVC(identifierName: identifierName, StoryBoardName: StoryBoardName, animated: animated)
            }
            
        }))
        UIApplication.topViewController()?.present(refreshAlert, animated: true, completion: nil)
    }
    
   
}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}


// MARK: V0.0.3 Eklendi
extension String {
    var toUTF8: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
extension String{
    private var htmlToAttributedString: NSAttributedString? {
            guard let data = data(using: .utf8) else { return nil }
            do {
                return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            } catch {
                return nil
            }
        }
        var htmlToString: String {
            return htmlToAttributedString?.string ?? ""
        }
}


