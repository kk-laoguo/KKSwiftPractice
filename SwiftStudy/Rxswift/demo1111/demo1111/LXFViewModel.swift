//
//  LXFViewModel.swift
//  demo1111
//
//  Created by gzy on 2019/2/19.
//  Copyright © 2019 gzy. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx


let rx_disposeBag = DisposeBag()


enum LXFRefreshStatus {
    case none
    case beingHeaderRefresh
    case endHeaderRefresh
    case beingFooterRefresh
    case endFooterRefresh
    case noMoreData
}

class LXFViewModel: NSObject {
    // 存放着解析完成的模型数组
    let models = Variable<[LXFModel]>([])
    // 记录当前的索引值
    var index: Int = 1
}

extension LXFViewModel: LXFViewModelType {

    
    
    typealias Input = LXFInput
    typealias Output = LXFOutput
    
    struct LXFInput {
        // 网络请求类型
        let category: LXFNetworkTool.LXFNetworkCategory
        
        init(category: LXFNetworkTool.LXFNetworkCategory) {
            self.category = category
        }
    }
    
    struct LXFOutput {
        // tableView的sections数据
        let sections: Driver<[LXFSection]>
        // 外界通过该属性告诉viewModel加载数据（传入的值是为了标志是否重新加载）
        let requestCommond = PublishSubject<Bool>()
        // 告诉外界的tableView当前的刷新状态
        let refreshStatus = Variable<LXFRefreshStatus>(.none)
        
        init(sections: Driver<[LXFSection]>) {
            self.sections = sections
        }
        
    }
    
    func transform(input: LXFViewModel.LXFInput) -> LXFViewModel.LXFOutput {
        
        let sections = models.asObservable().map { (models) -> [LXFSection] in
            // 当models的值被改变时会调用
            return [LXFSection(items: models)]
            }.asDriver(onErrorJustReturn: [])
        
        let output = LXFOutput(sections: sections)
        
        
        output.requestCommond.subscribe(onNext: { [unowned self] isReloadData in
            self.index = isReloadData ? 1 : self.index+1
            
            lxfNetTool.rx.request(.data(type: input.category, size: 10, index: self.index))
            .mapArray(LXFModel.self)
            .subscribe(onSuccess: {  (models) in
                self.models.value = isReloadData ? models : ( self.models.value ) + models
                LXFProgressHUD.showSuccess("加载成功")
                output.refreshStatus.value = isReloadData ? .endHeaderRefresh : .endFooterRefresh

                
            }, onError: { (error) in
                LXFProgressHUD.showError(error.localizedDescription)
                output.refreshStatus.value = isReloadData ? .endHeaderRefresh : .endFooterRefresh

            }).disposed(by: rx_disposeBag)
            

        }).disposed(by: rx_disposeBag)
        
        return output
    }

}


