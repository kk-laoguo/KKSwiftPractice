//
//  SegmentMainController.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/26.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit
import HMSegmentedControl

enum SegmentStyle {
    case none, navgationBarSegment, topTabBar
}

class SegmentMainController: BaseViewController {
    
    var segmentStyle: SegmentStyle!
    private(set) var vcs: [UIViewController]!
    private(set) var titles: [String]!
    private var currentSelectIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    convenience init(titles: [String] = [],
                     vcs: [UIViewController] = [],
                     segmentStyle: SegmentStyle = .none) {
        self.init()
        self.titles = titles
        self.vcs = vcs
        self.segmentStyle = segmentStyle
    }
    
    lazy var segment: HMSegmentedControl = {
        return HMSegmentedControl().then {
            $0.addTarget(self, action: #selector(changeIndex(segment:)), for: .valueChanged)
        }
    }()
    lazy var pageVC: UIPageViewController = {
        return UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }()
    
    override func setupLayout() {
        guard let vcs = vcs else { return }
        addChild(pageVC)
        view.addSubview(pageVC.view)
        
        pageVC.dataSource = self
        pageVC.delegate = self
        pageVC.setViewControllers([vcs[0]], direction: .forward, animated: true, completion: nil)
        
        switch segmentStyle {
        case .none:
            pageVC.view.snp.makeConstraints { $0.edges.equalToSuperview() }
        case .navgationBarSegment:
            segment.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
            segment.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)]
            
            
            segment.selectionIndicatorLocation = .bottom
            segment.backgroundColor = .white
            view.addSubview(segment)
            segment.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 80)
            pageVC.view.snp.makeConstraints { $0.edges.equalToSuperview() }
            
        case .topTabBar:
            segment.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            segment.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(r: 127, g: 221, b: 146),
                                                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            segment.selectionIndicatorLocation = .bottom
            segment.selectionIndicatorColor = UIColor(r: 127, g: 221, b: 146)
            segment.selectionIndicatorHeight = 2
            segment.borderType = .bottom
            segment.borderColor = UIColor.lightGray
            segment.borderWidth = 0.5
            
            view.addSubview(segment)
            segment.snp.makeConstraints { (make) in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(40)
            }
            
            pageVC.view.snp.makeConstraints { (make) in
                make.top.equalTo(segment.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
        default:
            break
            
        }
        guard let titles = titles else { return }
        segment.sectionTitles = titles
        currentSelectIndex = 0
        segment.selectedSegmentIndex = UInt(currentSelectIndex)
        
    }
    
    
}


extension SegmentMainController {
    @objc func changeIndex(segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        if currentSelectIndex != index {
            let target: [UIViewController] = [vcs[index]]
            let direction: UIPageViewController.NavigationDirection = currentSelectIndex > index ? .reverse:.forward
            pageVC.setViewControllers(target, direction: direction, animated: true) { [weak self] (finish) in
                self?.currentSelectIndex = index
            }
        }
    }
}


extension SegmentMainController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcs.firstIndex(of: viewController) else { return nil }
        let beforeIndex = index - 1
        guard beforeIndex >= 0 else { return nil }
        return vcs[beforeIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = vcs.firstIndex(of: viewController) else { return nil }
        let afterIndex = index + 1
        guard afterIndex <= vcs.count - 1 else { return nil }
        return vcs[afterIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        guard let viewController = pageViewController.viewControllers?.last,
            let index = vcs.firstIndex(of: viewController) else {
                return
        }
        currentSelectIndex = index
        segment.setSelectedSegmentIndex(UInt(index), animated: true)
        guard titles != nil && segmentStyle == Optional.none else { return }
        navigationItem.title = titles[index]
    }
    
}
