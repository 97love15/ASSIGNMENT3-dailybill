//
//  KeyboardView.swift
//  Daily-Bill
//
//  Created by Jackey on 2022/05/10.
//

import UIKit

protocol KeyboardViewDelegate: NSObjectProtocol{
    func keyboardHandler(title: String, key: Key.KeyNumber)
}

class KeyboardView: UIView, KeyDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
  
    var doneKey: Key?
    var delegate: KeyboardViewDelegate?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupUI(frame: frame)
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     // MARK: - SetupUI
    
    func setupUI(frame: CGRect) -> Void {
        
        let itemWidth: CGFloat = frame.size.width / 4.0
        let itemHeight: CGFloat = frame.size.height / 4.3
        
        let params: NSArray = ["7", "8", "9", "+",
                               "4", "5", "6", "-",
                               "1", "2", "3", "finish",
                               ".", "0", ""]
        for i in 0...14 {
            
            let row: Int = i / 4
            let column: Int = i % 4
            
            let title: String = params.object(at: i) as? String ?? ""
            
            var rect: CGRect!
            if i == 11 {
                rect = CGRect.init(x: CGFloat.init(integerLiteral: column) * itemWidth, y: CGFloat.init(integerLiteral: row) * itemHeight, width: itemWidth, height: itemHeight * 2)
            }else {
                rect = CGRect.init(x: CGFloat.init(integerLiteral: column) * itemWidth, y: CGFloat.init(integerLiteral: row) * itemHeight, width: itemWidth, height: itemHeight)

            }
            
            
            let key: Key = Key.init(frame: rect, title: title)
            key.delegate = self
            self.addSubview(key)
            
            switch i
            {
            case 0:
                key.keyNumber = Key.KeyNumber.seven
                break
            case 1:
                key.keyNumber = Key.KeyNumber.eight
                break
            case 2:
                key.keyNumber = Key.KeyNumber.nine
                break
            case 3:
                key.keyNumber = Key.KeyNumber.add
                break
            case 4:
                key.keyNumber = Key.KeyNumber.four
                break
            case 5:
                key.keyNumber = Key.KeyNumber.five
                break
            case 6:
                key.keyNumber = Key.KeyNumber.six
                break
            case 7:
                key.keyNumber = Key.KeyNumber.reduce
                break
            case 8:
                key.keyNumber = Key.KeyNumber.one
                break
            case 9:
                key.keyNumber = Key.KeyNumber.two
                break
            case 10:
                key.keyNumber = Key.KeyNumber.three
                break
            case 11:
                key.setNormalColor(color: spendingColor)
                key.keyNumber = Key.KeyNumber.done
                self.doneKey = key
                break
            case 12:
                key.keyNumber = Key.KeyNumber.point
                break
            case 13:
                key.keyNumber = Key.KeyNumber.zero
                break
            case 14:
                key.setTitle("back", for: .normal)
                key.setTitleColor(spendingColor, for: .normal)
                key.keyNumber = Key.KeyNumber.delete
                break
            default: break
                
            }
        }
        
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return super.hitTest(point, with: event)
    }
    
     // MARK: - KeyDelegate
    
    func clickHandler(key: Key) {
        
        
        self.delegate?.keyboardHandler(title: key.titleLabel?.text ?? "", key: key.keyNumber ?? Key.KeyNumber.none)
        
        switch key.keyNumber {
   
        case .add?:
            self.doneKey?.setNormalColor(color: key.normalColor)
            self.doneKey?.keyNumber = Key.KeyNumber.equal
            self.doneKey?.setTitle("=", for: UIControl.State.normal)
            break
        case .reduce?:
            self.doneKey?.setNormalColor(color: key.normalColor)
            self.doneKey?.keyNumber = Key.KeyNumber.equal
            self.doneKey?.setTitle("=", for: UIControl.State.normal)
            break
        case .equal?:
            self.doneKey?.setNormalColor(color: spendingColor)
            self.doneKey?.keyNumber = Key.KeyNumber.done
            self.doneKey?.setTitle("finish", for: UIControl.State.normal)
            break
        default:
            break
        }
        
        
        
    }
}
