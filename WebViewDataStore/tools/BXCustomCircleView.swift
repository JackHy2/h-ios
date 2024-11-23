//
//  BXCustomCircleView.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/20.
//

import UIKit

class BXCustomCircleView: UIView {
    
    var tapBlock: ((_ index: Int) -> Void)?

    private var count: Int = 0
    private var selectIndex: Int = 0
    private var selectView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCircleCount(_ count: Int) {
        self.count = count
        setupSubview()
    }
    func setCircleSelectIndex(_ selectIndex: Int) {
        if selectIndex == self.selectIndex {
            return
        }
        self.selectIndex = selectIndex
        for (index, view) in subviews.enumerated() {
            if index == selectIndex {
                selectView?.backgroundColor = UIColor.black.withAlphaComponent(0.3)
                view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
                selectView = view
                break
            }
        }
    }
}

extension BXCustomCircleView {
    private func setupSubview() {
        // 26 = 12 + 6 + 8
        // 3*8 + 2*8 (2n-1)*8
        let tempX = (self.bx_width - CGFloat((Int(2.0)*count - 1))*8.0)/2.0
        let tempY = 12.0
        let valueW = 8.0, distanceX = 8.0
        for i in 0..<count {
            let circleView = UIView(frame: CGRect(x: tempX + (valueW + distanceX)*Double(i), y: tempY, width: valueW, height: valueW))
            circleView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            if i == selectIndex {
                circleView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
                selectView = circleView
            }
            circleView.layer.cornerRadius = valueW/2.0
            circleView.tag = i + 10
            addSubview(circleView)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapGesture))
            circleView.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc private func viewTapGesture(gesture: UITapGestureRecognizer) {
        if gesture.view == selectView { return }
        
        selectView?.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        gesture.view?.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        selectView = gesture.view
        
        let index = gesture.view!.tag - 10
        if let tapBlock = tapBlock {
            tapBlock(index)
        }
        Date().timeIntervalSince1970
//        (self.tapBlock ?? <#default value#>)(index)
    }
}


//this.list = [{
//        label: '我的终端',
//        key: 'client',
//        image: 'menu_icon_1.png',
//        permission: this.$hasPermission('CLIENT_MANAGE'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/client-list/index',
//          }),
//      },
//      {
//        label: '终端开发',
//        key: 'RECOMMEND_BLANK_STORE',
//        image: 'menu_icon_21.png',
//        permission: this.$hasPermission('RECOMMEND_BLANK_STORE'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/recommend-blank-store/index',
//          }),
//      },
//      {
//        label: '举证管理',
//        key: 'evidence',
//        image: 'menu_icon_2.png',
//        permission: this.$hasPermission('EVIDENCE_MANAGE'),
//        onClick: () => this.handleClickEvidence(),
//      },
//      {
//        label: '检核',
//        key: 'visitCheck',
//        image: 'menu_icon_3.png',
//        permission: this.$hasPermission('VISIT_CHECK'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/visit/visit-check/index',
//          }),
//      },
//      {
//        label: '陈列审核',
//        key: 'display',
//        image: 'menu_icon_4.png',
//        // permission: true,
//        permission: this.$hasPermission('DISPLAY_MANAGE'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/display-audit-list/index',
//          }),
//      },
//      {
//        label: '路线申请',
//        key: 'path_apply',
//        image: 'menu_icon_5.png',
//        permission: this.$hasPermission('PATH_APPLY'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/path-apply/path-list',
//          }),
//      },
//      {
//        label: '路线审核',
//        key: 'path_audit',
//        image: 'menu_icon_6.png',
//        permission: this.$hasPermission('PATH_AUDIT'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/path-audit-list/index',
//          }),
//      },
//      {
//        label: '库存查看',
//        key: 'storehouse-check',
//        image: 'menu_icon_9.png',
//        permission: this.$hasPermission('STOREHOUSE_STOCK_CHECK'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/storehouse-stock-check/index',
//          }),
//      },
//      {
//        label: '车仓管理',
//        key: 'car-storehouse',
//        image: 'menu_icon_8.png',
//        // permission: true,
//        permission: this.$hasPermission('CAR_STOREHOUSE_MANAGE'),
//        onClick: () => this.goCarManagePage(),
//      },
//      {
//        label: '随访',
//        key: 'follow_visit',
//        image: 'menu_icon_7.png',
//        // permission: true,
//        permission: this.$hasPermission('FOLLOW_VISIT_MANAGE'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/visit/follow-visit-choose/index',
//          }),
//      },
//      {
//        label: '终端余货',
//        key: 'terminal-shortage',
//        image: 'menu_icon_14.png',
//        permission: this.$hasPermission('TERMINAL_SHORTAGE'),
//        // permission: true,
//        onClick: () =>
//          this.$$router({
//            url: '/pages/terminal-manage/terminal-shortage-list',
//          }),
//      },
//      {
//        label: '销售查看',
//        key: 'sales-check',
//        image: 'menu_icon_9.png',
//        permission: this.$hasPermission('SALES_CHECK'),
//        // permission: true,
//        onClick: () =>
//          this.$$router({
//            url: '/pages/sales-check/sales-check-list',
//          }),
//      },
//      {
//        label: '终端欠款',
//        key: 'terminal-balance',
//        image: 'menu_icon_10.png',
//        // permission: true,
//        permission: this.$hasPermission('TREMINAL_BALANCE'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/terminal-manage/terminal-balance-list',
//          }),
//      },
//      {
//        label: '汇总结算',
//        key: 'summary-settlement',
//        image: 'menu_icon_11.png',
//        // permission: true,
//        permission: this.$hasPermission('SUMMARY_SETTLEMENT'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/summary-settlement/summary-settlement-list/index',
//          }),
//      },
//      {
//        label: '配送',
//        key: 'distribution',
//        image: 'menu_icon_13.png',
//        permission: this.$hasPermission('VISIT_DISTRIBUTION'),
//        // permission: true,
//        onClick: () => this.handleDistribution(),
//      },
//      {
//        label: '订单管理',
//        key: 'order-manage',
//        image: 'menu_icon_12.png',
//        // permission: true,
//        permission: this.$hasPermission('ORDER_MANAGE'),
//        onClick: () =>
//          // this.$$router({
//          //   url: '/subPackages/order-manage/index',
//          // }),
//          this.$$router({
//            url: '/pages/order-manage/index',
//          }),
//      },
//      {
//        label: '装卸车审核',
//        key: 'load-application-audit',
//        image: 'menu_icon_15.png',
//        // permission: true,
//        permission: this.$hasPermission('LOAD_APPLICATION_AUDIT'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/load-application-audit/index',
//          }),
//      },
//      {
//        label: '终端审核',
//        key: 'terminal-audit',
//        image: 'terminal-audit.png',
//        permission: this.$hasPermission('TERMINAL_AUDIT'),
//        onClick: () =>
//          this.$$router({
//            url: '/pages/visit/terminal-audit/index',
//          }),
//      },
//      // {
//      //   label: '闭店审核',
//      //   key: 'store-close-list',
//      //   image: 'menu_icon_15.png',
//      //   // permission: true,
//      //   permission: this.$hasPermission('STORE_CLOSE_APPROVE'),
//      //   onClick: () =>
//      //     this.$$router({
//      //       url: '/pages/store-close-list/index',
//      //     })
//      // },
//      // {
//      //   label: '今日总结',
//      //   key: 'today-summarize',
//      //   image: 'menu_icon_16.png',
//      //   // permission: true,
//      //   permission: this.$hasPermission('TODAY_SUMMARIZE'),
//      //   onClick: () =>
//      //     this.$$router({
//      //       url: '/subPackages/today-summarize/index',
//      //     }),
//      // },
//      // {
//      //   label: '评价总结',
//      //   key: 'evaluate-summarize',
//      //   image: 'menu_icon_17.png',
//      //   permission: this.$hasPermission('EVALUATE_SUMMARIZE'),
//      //   // permission: true,
//      //   onClick: () =>
//      //     this.$$router({
//      //       url: '/subPackages/evaluate-summarize-list/index',
//      //     }),
//      // },
//      {
//        label: '推广促销',
//        key: 'promotion-manage',
//        image: 'menu_icon_20.png',
//        permission: this.$hasPermission('PROMOTION_MANAGE'),
//        onClick: () =>
//        // this.$$router({
//        //   url: '/promomtionSubpackage/promotion-menu/index',
//        // }),
//          this.$$router({
//            url: '/pages/promotion-menu/index',
//          }),
//      },
