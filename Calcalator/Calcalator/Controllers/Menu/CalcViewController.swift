//
//  CalcViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 23.12.2022.
//

//
//  ViewController.swift
//  calc
//
//  Created by Дмитрий Корчагин on 17.11.2022.
//

import UIKit

class CalcViewController: UIViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    
    // MARK: - Variables
    let imageMenu = UIImage(named: "menu")
    let imageMenuPressed = UIImage(named: "menuPressed")
    let imageHistory = UIImage(named: "history")
    let imageHistoryPressed = UIImage(named: "historyPressed")
    
    let buttons = UIButton.createNumbersButtons()
    let buttonHistory = UIButton(type: .system)
    
    let historyTextView = UITextView.createSmallTextView()
    let textField = UITextField.createCustomTextField()
    
    let userDefaults = UserDefaults.standard
    
    var gesture = [UISwipeGestureRecognizer]()
    var sizes = Sizes()
    var r1: Double? = nil, r2:Double? = nil
    var result = Double()
    var answer = String()
    var text = String()
    var tag: Int = -1
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Calculator"
        setUpView()
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .landscape]
    }
    // MARK: - methods

    func setUpView(){
        changeNavVC()
        sizes = Sizes(view.bounds.size.width, view.bounds.size.height)
        addSubViews()
        createButtonsToOpenOtherVC()
        createTextFieldConstraint()

        createHistoryTextViewConstraints()

        createButtons()
    }
    func addSubViews(){
        view.addSubview(buttonHistory)
        view.addSubview(historyTextView)
        view.addSubview(textField)
        for i in 0..<19{
            view.addSubview(buttons[i])
        }

    }
    
    func changeNavVC(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.placeholderText] // With a red background, make the title more readable.
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.delegate = self
    }
    
    func createButtonsToOpenOtherVC(){
        
        buttonHistory.backgroundColor = .clear
        buttonHistory.translatesAutoresizingMaskIntoConstraints = false
        
        buttonHistory.setImage(imageHistory!.scaleImageToFitSize(size: CGSize(width: (navigationController?.navigationBar.bounds.size.height)! - 5, height: (navigationController?.navigationBar.bounds.size.height)! - 5)), for: .normal)
        buttonHistory.setImage(imageHistoryPressed!.scaleImageToFitSize(size: CGSize(width: (navigationController?.navigationBar.bounds.size.height)! - 5, height: (navigationController?.navigationBar.bounds.size.height)! - 5)), for: .highlighted)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonHistory)
        buttonHistory.bounds.size.width = (navigationController?.navigationBar.bounds.size.height)!
        buttonHistory.bounds.size.height = (navigationController?.navigationBar.bounds.size.height)!
        buttonHistory.addTarget(self, action: #selector(openHistoryViewController), for: .touchUpInside)
    }
    
    @objc func openHistoryViewController(){
        let HistoryVC = HistoryViewController()
        text.removeAll()
        self.navigationController?.pushViewController(HistoryVC, animated: true)
    }
    func createHistoryTextViewConstraints(){
        NSLayoutConstraint.activate([
            historyTextView.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -sizes.sizeSpace),
            historyTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: sizes.sizeSpace),
            historyTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -sizes.sizeSpace),
            historyTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: sizes.sizeSpace)
        ])
    }

    func createTextFieldConstraint(){
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: sizes.sizeSpace),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -sizes.sizeSpace),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: sizes.sizeDivide),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func createButtons(){
        createButtonsConstraints()
        createButtonsTargets()
    }
    func createButtonsTargets(){
        buttons[0].addTarget(self, action: #selector(num0), for: .touchUpInside)
        buttons[1].addTarget(self, action: #selector(num1), for: .touchUpInside)
        buttons[2].addTarget(self, action: #selector(num2), for: .touchUpInside)
        buttons[3].addTarget(self, action: #selector(num3), for: .touchUpInside)
        buttons[4].addTarget(self, action: #selector(num4), for: .touchUpInside)
        buttons[5].addTarget(self, action: #selector(num5), for: .touchUpInside)
        buttons[6].addTarget(self, action: #selector(num6), for: .touchUpInside)
        buttons[7].addTarget(self, action: #selector(num7), for: .touchUpInside)
        buttons[8].addTarget(self, action: #selector(num8), for: .touchUpInside)
        buttons[9].addTarget(self, action: #selector(num9), for: .touchUpInside)
        buttons[10].addTarget(self, action: #selector(pressDivide), for: .touchUpInside)
        buttons[11].addTarget(self, action: #selector(pressPlus), for: .touchUpInside)
        buttons[12].addTarget(self, action: #selector(pressMinus), for: .touchUpInside)
        buttons[13].addTarget(self, action: #selector(pressMultiply), for: .touchUpInside)
        buttons[14].addTarget(self, action: #selector(pressEqual), for: .touchUpInside)
        buttons[15].addTarget(self, action: #selector(pressPoint), for: .touchUpInside)
        buttons[16].addTarget(self, action: #selector(pressCLear), for: .touchUpInside)
        buttons[17].addTarget(self, action: #selector(pressPercent), for: .touchUpInside)
        buttons[18].addTarget(self, action: #selector(pressAC), for: .touchUpInside)
    }
    func createButtonsConstraints(){
        /*
        var buttonDivide:       // 10
        var butttonZnak:        // 11
        var buttonPlus:         // 12
        var buttonMinus:        // 13
        var buttonMultiply:     // 14
        var buttonEuqal:        // 15
        var buttonPoint:        // 16
        var buttonClear:        // 17
        var buttonPersent:      // 18
        var buttonCleanHistory: // 19
         */
        NSLayoutConstraint.activate([
            buttons[18].leftAnchor.constraint(equalTo: view.leftAnchor, constant: sizes.sizeSpace),
            buttons[18].topAnchor.constraint(equalTo: textField.bottomAnchor, constant: sizes.sizeSpace),
            buttons[17].leftAnchor.constraint(equalTo: buttons[9].rightAnchor, constant: sizes.sizeSpace),
            buttons[17].topAnchor.constraint(equalTo: textField.bottomAnchor, constant: sizes.sizeSpace),
            buttons[16].leftAnchor.constraint(equalTo: buttons[8].rightAnchor, constant: sizes.sizeSpace),
            buttons[16].topAnchor.constraint(equalTo: textField.bottomAnchor, constant: sizes.sizeSpace),
            
            buttons[10].leftAnchor.constraint(equalTo: buttons[7].rightAnchor, constant: sizes.sizeSpace),
            buttons[10].topAnchor.constraint(equalTo: textField.bottomAnchor, constant: sizes.sizeSpace),
            
            buttons[13].leftAnchor.constraint(equalTo: buttons[9].rightAnchor,constant: sizes.sizeSpace),
            buttons[13].topAnchor.constraint(equalTo: buttons[10].bottomAnchor, constant: sizes.sizeSpace),
            buttons[12].leftAnchor.constraint(equalTo: buttons[6].rightAnchor,constant: sizes.sizeSpace),
            buttons[12].topAnchor.constraint(equalTo: buttons[13].bottomAnchor, constant: sizes.sizeSpace),
            buttons[11].leftAnchor.constraint(equalTo: buttons[3].rightAnchor,constant: sizes.sizeSpace),
            buttons[11].topAnchor.constraint(equalTo: buttons[12].bottomAnchor, constant: sizes.sizeSpace),
            buttons[14].topAnchor.constraint(equalTo: buttons[11].bottomAnchor, constant: sizes.sizeSpace),
            buttons[14].leftAnchor.constraint(equalTo: buttons[15].rightAnchor, constant: sizes.sizeSpace),
            buttons[15].leftAnchor.constraint(equalTo: buttons[0].rightAnchor, constant: sizes.sizeSpace),
            buttons[15].topAnchor.constraint(equalTo: buttons[3].bottomAnchor, constant: sizes.sizeSpace),
            
            buttons[7].leftAnchor.constraint(equalTo: view.leftAnchor, constant: sizes.sizeSpace),
            buttons[7].topAnchor.constraint(equalTo: buttons[18].bottomAnchor, constant: sizes.sizeSpace),
            buttons[8].leftAnchor.constraint(equalTo: buttons[7].rightAnchor, constant: sizes.sizeSpace),
            buttons[8].topAnchor.constraint(equalTo: buttons[17].bottomAnchor, constant: sizes.sizeSpace),
            buttons[9].leftAnchor.constraint(equalTo: buttons[8].rightAnchor, constant: sizes.sizeSpace),
            buttons[9].topAnchor.constraint(equalTo: buttons[16].bottomAnchor, constant: sizes.sizeSpace),
            buttons[4].leftAnchor.constraint(equalTo: view.leftAnchor, constant: sizes.sizeSpace),
            buttons[4].topAnchor.constraint(equalTo: buttons[7].bottomAnchor, constant: sizes.sizeSpace),
            buttons[5].leftAnchor.constraint(equalTo: buttons[4].rightAnchor, constant: sizes.sizeSpace),
            buttons[5].topAnchor.constraint(equalTo: buttons[8].bottomAnchor, constant: sizes.sizeSpace),
            buttons[6].leftAnchor.constraint(equalTo: buttons[5].rightAnchor, constant: sizes.sizeSpace),
            buttons[6].topAnchor.constraint(equalTo: buttons[9].bottomAnchor, constant: sizes.sizeSpace),
            buttons[1].leftAnchor.constraint(equalTo: view.leftAnchor, constant: sizes.sizeSpace),
            buttons[1].topAnchor.constraint(equalTo: buttons[4].bottomAnchor, constant: sizes.sizeSpace),
            buttons[2].leftAnchor.constraint(equalTo: buttons[1].rightAnchor, constant: sizes.sizeSpace),
            buttons[2].topAnchor.constraint(equalTo: buttons[5].bottomAnchor, constant: sizes.sizeSpace),
            buttons[3].leftAnchor.constraint(equalTo: buttons[2].rightAnchor, constant: sizes.sizeSpace),
            buttons[3].topAnchor.constraint(equalTo: buttons[6].bottomAnchor, constant: sizes.sizeSpace),
            
            buttons[0].leftAnchor.constraint(equalTo: view.leftAnchor, constant: sizes.sizeSpace),
            buttons[0].topAnchor.constraint(equalTo: buttons[1].bottomAnchor, constant: sizes.sizeSpace),
            buttons[0].rightAnchor.constraint(equalTo: buttons[15].leftAnchor, constant: -sizes.sizeSpace)
        ])
        
        buttons.forEach({ button in
            if button.tag == 0{
                button.widthAnchor.constraint(equalToConstant: 2*sizes.sizeButton + sizes.sizeSpace).isActive = true
            } else {
                button.widthAnchor.constraint(equalToConstant: sizes.sizeButton).isActive = true
            }
            button.heightAnchor.constraint(equalToConstant: sizes.sizeButton).isActive = true
        })
    }
    
    // MARK: - targets
    @objc func pressDivide(){
        r1 = Double(textField.text!)
        textField.text?.removeAll()
        tag = 0
    }
    @objc func pressPlus(){
        r1 = Double(textField.text!)
        textField.text?.removeAll()
        tag = 1
    }
    @objc func pressMinus(){
        r1 = Double(textField.text!)
        textField.text?.removeAll()
        tag = 2
    }
    @objc func pressMultiply(){
        r1 = Double(textField.text!)
        textField.text?.removeAll()
        tag = 3
    }
    @objc func pressEqual(){
        r2 = Double(textField.text!)
        if(r1 != nil && r2 != nil){
            switch tag{
            case 0:
                result = r1!/r2!
                historyTextView.text += "\(returnResult(a: r1!)) ÷ \(returnResult(a:r2!)) = \(returnResult(a:result))\n"
                text += "\(returnResult(a: r1!)) ÷ \(returnResult(a:r2!)) = \(returnResult(a:result))\n"
                r1 = nil
                r2 = nil
                tag = -1
                textField.text?.removeAll()
            case 1:
                result = r1! + r2!
                historyTextView.text += "\(returnResult(a: r1!)) + \(returnResult(a:r2!)) = \(returnResult(a:result))\n"
                text += "\(returnResult(a: r1!)) + \(returnResult(a:r2!)) = \(returnResult(a:result))\n"
                r1 = nil
                r2 = nil
                tag = -1
                textField.text?.removeAll()
            case 2:
                result = r1! - r2!
                historyTextView.text += "\(returnResult(a: r1!)) - \(returnResult(a:r2!)) = \(returnResult(a:result))\n"
                text += "\(returnResult(a: r1!)) - \(returnResult(a:r2!)) = \(returnResult(a:result))\n"
                r1 = nil
                r2 = nil
                tag = -1
                textField.text?.removeAll()
            case 3:
                result = r1! * r2!
                historyTextView.text += "\(returnResult(a: r1!)) • \(returnResult(a:r2!)) = \(returnResult(a:result))\n"
                text += "\(returnResult(a: r1!)) • \(returnResult(a:r2!)) = \(returnResult(a:result))\n"
                r1 = nil
                r2 = nil
                tag = -1
                textField.text?.removeAll()
            default:
                print("defabult case in switch tag")
            }
        }
        save()
    }
    
    @objc func pressPoint(){
        if let _ = textField.text?.firstIndex(of: "."){
            
        } else {
            if textField.text?.count ?? 0 == 0{
                textField.text! += "0."
            } else {
                textField.text! += "."
            }
        }
        
    }
    @objc func pressCLear(){
        if textField.text?.count ?? 0 > 0{
            if textField.text == "0."{
                textField.text?.removeLast()
            }
            textField.text?.removeLast()
        }
    }
    @objc func pressPercent(){
        if ((textField.text?.isEmpty)!){
            result = 1
            historyTextView.text += "1% = \(result/100)\n"
            text += "1% = \(result/100)\n"
            textField.text?.removeAll()
        } else {
            result = Double(textField.text!)!
            historyTextView.text += "\(returnResult(a: result))% = \(returnResult(a: result/100))\n"
            text += "\(returnResult(a: result))% = \(returnResult(a: result/100))\n"
            textField.text?.removeAll()
        }
        save()
    }
    @objc func pressAC(){
        r1 = nil
        r2 = nil
        textField.text?.removeAll()
        historyTextView.text.removeAll()
        UserDefaults.standard.set("", forKey: "text")
        userDefaults.removeObject(forKey: "text")
    }
    
    @objc func num0(){
        if textField.text! != ""{
            textField.text! += "0"
        } else if textField.text! == ""{
            textField.text! += "0."
        }
    }
    @objc func num1(){
        textField.text! += "1"
    }
    @objc func num2(){
        textField.text! += "2"
    }
    @objc func num3(){
        textField.text! += "3"
    }
    @objc func num4(){
        textField.text! += "4"
    }
    @objc func num5(){
        textField.text! += "5"
    }
    @objc func num6(){
        textField.text! += "6"
    }
    @objc func num7(){
        textField.text! += "7"
    }
    @objc func num8(){
        textField.text! += "8"
    }
    @objc func num9(){
        textField.text! += "9"
    }
    
    func save(){
        UserDefaults.standard.set(text, forKey: "text")
    }
    
}
// MARK: - Tasks:
/*
 - ввод не одного выражения а столько сколько угодно
 - кнопка равно сбрасывает введенное число
 - сделать наполение новых контроллеров
 */
