//
//  AllChapterVC.swift
//  U17
//
//  Created by lyw on 2020/5/22.
//  Copyright © 2020 胡智钦. All rights reserved.
//

import UIKit

class AllChapterVC: BaseViewController {

    @IBOutlet weak var totalLb: UILabel!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var comicId: Int?
    private var isPositive: Bool = true
    // 漫画基本信息
    var detailComic: ComicDetailModel?
    var chapterList = [ChapterModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 100
        tableView.register(cellType: ChapterCell.self)
        tableView.uempty = UEmptyView { [weak self] in
            self?.loadData()
        }
        self.loadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
   
    func loadData() {
        ApiProvider.request(Api.comicChapterList(comicid: comicId ?? 0), model: ChapterListModels.self) { (response) in
            self.chapterList = response?.chapter_list ?? []
            self.totalLb.text = "（共 \(self.chapterList.count) 话）"
            self.tableView.reloadData()
        }
    }
}

extension AllChapterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chapterList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ChapterCell.self)
        cell.model = chapterList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if chapterList.count > 0 {
            let vc = ReadComicVC(detailComic: self.detailComic,
                                 chapterList: chapterList,
                                 selectIndex: indexPath.row)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
   
}

extension AllChapterVC {
    
    // MARK: - 正序/倒序
    @IBAction func reverseClick(_ sender: Any) {
        if chapterList.count > 0 {
            isPositive = !isPositive
            leftBtn.setTitleColor(isPositive ? .black:.lightGray, for: .normal)
            rightBtn.setTitleColor(isPositive ? .lightGray:.black, for: .normal)
            
            self.chapterList.reverse()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
