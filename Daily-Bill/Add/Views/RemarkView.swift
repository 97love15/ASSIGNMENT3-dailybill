//
//  RemarkView.swift
//  Daily-Bill
//
//  Created by Jackey on 2022/05/10.
//

import UIKit

@objc protocol RemarkViewDelegate: NSObjectProtocol{
    @objc optional func remarkTV(beginEditing textView: UITextView)
    @objc optional func remarkTV(endEditing textView: UITextView)
    @objc optional func remarkTV(editingComplete: UITextView)
}


class RemarkView: UIView, UITextViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    weak var delegate: RemarkViewDelegate?
    
    lazy var remarkTV: UITextView = {
        let aRemarkTV: UITextView = UITextView.init()
        aRemarkTV.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        aRemarkTV.text = "you can write some notes here"
        aRemarkTV.textColor = UIColor.lightGray
        aRemarkTV.textAlignment = .center
        aRemarkTV.delegate = self
        aRemarkTV.returnKeyType = UIReturnKeyType.done
        aRemarkTV.keyboardAppearance = .dark
        return aRemarkTV
    }()
    


     // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     // MARK: - SetupUI
    
    func setupUI(frame: CGRect) -> Void {
        
        self.addSubview(self.remarkTV)
        self.remarkTV.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height)
        remarkTV.backgroundColor = cellColor
        remarkTV.layer.cornerRadius = 5
        
    }
    
     // MARK: - Methods
    
    func inputSetHostView() -> UIView {
        return self.remarkTV.inputView?.superview ?? UIView.init()
    }

    func tvIsFirstResponder() -> Bool {
        return self.remarkTV.isFirstResponder
    }

    func tvBecomeFirstResponder() -> Void {
        self.remarkTV.becomeFirstResponder()
    }

    func setText(text: String) -> Void {
        self.remarkTV.text = text
        //changeFrame(textView: self.remarkTV)
    }
    
    func changeFrame(textView: UITextView) -> Void {
        
        var frame: CGRect = textView.frame
        frame.size.height = textView.contentSize.height
        textView.frame = frame
        
        var superViewFrame: CGRect = textView.superview?.frame ?? CGRect.zero
        superViewFrame.size.height = frame.height
        textView.superview?.frame = superViewFrame
        
    }
    
     // MARK: - UITextViewDelegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.text == " you can write something here" {
            textView.text = ""
            textView.textColor = .white
        }
        
        self.delegate?.remarkTV!(beginEditing: textView)
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.count < 1{
            textView.text = " you can write something here"
            textView.textColor = UIColor.lightGray
        }
        
        self.delegate?.remarkTV!(endEditing: textView)

    }
    
    func textViewDidChange(_ textView: UITextView) {
        
//        let rect: CGRect = (textView.text as NSString).boundingRect(with: CGSize.init(width: textView.frame.width, height: 0), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : textView.font ?? UIFont.systemFont(ofSize: 12)], context: nil)
        
       //changeFrame(textView: textView)
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            self.delegate?.remarkTV!(editingComplete: textView)
            textView.resignFirstResponder()
            return false
        }
        return true
    }

}
