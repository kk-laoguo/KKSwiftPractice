import UIKit
import PlaygroundSupport

// command + shift + enter == run
var str = "Hello, playground"


let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = .red
PlaygroundPage.current.liveView = view

let imageView = UIImageView(image: UIImage(named: "zain"))
PlaygroundPage.current.liveView = imageView

let vc = UITableViewController()
vc.view.backgroundColor = .lightGray
PlaygroundPage.current.liveView = vc
//: [Next](@next)
