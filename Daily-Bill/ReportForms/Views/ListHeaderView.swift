//
//  ListHeaderView.swift
//  Daily-Bill
//
//  Created by Jackey on 2022/05/10.
//

import UIKit

class ListHeaderView: UITableViewHeaderFooterView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var contentLabel: UILabel?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        
        let label: UILabel = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = .white
        label.text = "05,20 Thursday"
        self.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(17)
            make.bottom.equalToSuperview()
        }
        self.contentLabel = label
    }
}
