//
//  Details_ListTableViewHeader.swift
//  Daily-Bill
//
//  Created by Jackey on 2022/05/10.
//

import UIKit

class Details_ListTableViewHeader: UITableViewCell {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var oneLabel: UILabel?
    var twoLabel: UILabel?
    var threeLabel: UILabel?
    var _headerModel: TallyListHeaderModel?
    var headrModel: TallyListHeaderModel{
        set{
            _headerModel = newValue
            oneLabel?.text = _headerModel?.date
            twoLabel?.text = String(format: "dayoutcome：¥ %@", _headerModel?.spendingAmount ?? "0.00").appending("    ")
//            twoLabel?.textColor = spendingColor
            threeLabel?.text = String(format: "dayincome：¥ %@", _headerModel?.incomeAmount ?? "0.00")
//            threeLabel?.textColor = incomeColor
        }
        get{
            return _headerModel ?? TallyListHeaderModel.init()
        }
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() -> Void {
        self.backgroundColor = themeColor
        
        let oneView: UIView = UIView.init()
        oneView.backgroundColor = themeColor//UIColor.init(red: 131 / 255.0, green: 111 / 255.0, blue: 255 / 255.0, alpha: 1)
        oneView.layer.cornerRadius = 5
        self.addSubview(oneView)
        oneView.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.top.equalTo(10)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }

        self.oneLabel = UILabel.init()
        self.oneLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        self.oneLabel?.textColor = .lightGray
        self.oneLabel?.text = "0308 Monday"
        oneView.addSubview(self.oneLabel ?? UILabel.init())
        self.oneLabel?.snp.makeConstraints({ (make) in
            make.height.equalTo(20)
            make.left.equalTo(7)
            make.centerY.equalToSuperview()
        })
        
        self.threeLabel = UILabel.init()
        self.threeLabel?.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        self.threeLabel?.textColor = .gray
        self.threeLabel?.text = "income：155"
        self.addSubview(self.threeLabel ?? UILabel.init())
        self.threeLabel?.snp.makeConstraints({ (make) in
            make.height.equalTo(20)
            make.right.equalToSuperview().offset(-17)
            make.top.equalTo(10)
        })

        self.twoLabel = UILabel.init()
        self.twoLabel?.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        self.twoLabel?.textColor = .gray
        self.twoLabel?.text = "outcome：155"
        self.addSubview(self.twoLabel ?? UILabel.init())
        self.twoLabel?.snp.makeConstraints({ (make) in
            make.height.equalTo(20)
            make.right.equalTo(self.threeLabel?.snp.left ?? 0)
            make.top.equalTo(10)
        })
        
    }
}
