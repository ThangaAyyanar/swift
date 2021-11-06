//
//  DetailScreenBottomView.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 03/11/21.
//

import UIKit

class DetailScreenBottomView: UIView {
    
    let detailButton: UIButton = ViewHelper.getUIButton(color: ColorHelper.green)
    let cancelButton: UIButton = ViewHelper.getUIButton(color: .orange)
    let playButton: UIButton = ViewHelper.getUIButton(color: ColorHelper.blue)
    let progressBar: UIView = ViewHelper.getUIView(color: ColorHelper.green)
    let downloadProgressText: UILabel = ViewHelper.getUILabel(text: "Download: 30 MB")
    
    var parentView: UIViewController?
    
    let startStateConstraint: NSLayoutConstraint
    var percentageMultiplier: NSLayoutConstraint
    
    var defaultConstraint: NSLayoutConstraint?
    
    var playButtonLeftAnchor: NSLayoutConstraint?
    var playButtonRightAnchor: NSLayoutConstraint?
    var playButtonConstraint: NSLayoutConstraint?
    
    init(detailScreen: UIViewController) {
        parentView = detailScreen
        startStateConstraint = detailButton.rightAnchor.constraint(equalTo: cancelButton.leftAnchor, constant: -5)
        percentageMultiplier = progressBar.widthAnchor.constraint(equalTo: detailButton.widthAnchor, multiplier: 0.1)
        super.init(frame: .zero)
        viewInitialize()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startDownload() {
        initiateDownload()
    }
    
    @objc func openBottonSheet() {
        let bottomSheet = BottomSheetView()
        bottomSheet.modalPresentationStyle = .overCurrentContext
        parentView?.present(bottomSheet, animated: false, completion: nil)
    }
    
    func viewInitialize() {
        
        detailButton.addTarget(self, action: #selector(startDownload), for: .touchUpInside)
        detailButton.layer.cornerRadius = 20
        detailButton.setTitle("", for: .normal)
        
        downloadProgressText.textAlignment = .center
        downloadProgressText.textColor = .white
        downloadProgressText.font = UIFont.boldSystemFont(ofSize: 20)
        
        cancelButton.setTitle("✕", for: .normal)
        cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        cancelButton.layer.cornerRadius = 35/2
        cancelButton.isHidden = true
        
        progressBar.layer.cornerRadius = 20
        progressBar.isHidden = true
        
        playButton.setTitle("PLAY", for: .normal)
        playButton.layer.cornerRadius = 20
        playButton.addTarget(self, action: #selector(openBottonSheet), for: .touchUpInside)
        
        self.addSubview(detailButton)
        self.addSubview(cancelButton)
        self.addSubview(progressBar)
        self.insertSubview(downloadProgressText, aboveSubview: progressBar)
        self.addSubview(playButton)
        
        defaultConstraint = detailButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        playButtonConstraint = playButton.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 30)
        playButtonLeftAnchor = playButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40)
        playButtonRightAnchor = playButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40)
        
        NSLayoutConstraint.activate([
            
            detailButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            defaultConstraint!,
            detailButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            detailButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            
            progressBar.leftAnchor.constraint(equalTo: detailButton.leftAnchor),
            progressBar.topAnchor.constraint(equalTo: detailButton.topAnchor),
            progressBar.bottomAnchor.constraint(equalTo: detailButton.bottomAnchor),
            percentageMultiplier,
            
            downloadProgressText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            downloadProgressText.rightAnchor.constraint(equalTo: detailButton.rightAnchor),
            downloadProgressText.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            downloadProgressText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            
            cancelButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            cancelButton.firstBaselineAnchor.constraint(equalTo: detailButton.firstBaselineAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 35),
            cancelButton.heightAnchor.constraint(equalToConstant: 35),
            
            playButtonLeftAnchor!,
            playButtonRightAnchor!,
            playButtonConstraint!,
            playButton.heightAnchor.constraint(equalTo: detailButton.heightAnchor),
        ])
    }
    
    func initiateDownload() {
        guard let defaultConstraint = defaultConstraint else {
            return
        }
        NSLayoutConstraint.deactivate([defaultConstraint])
        NSLayoutConstraint.activate([self.startStateConstraint])
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        UIView.transition(with: cancelButton, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.cancelButton.isHidden = false
        })
        
        let dispatchTime = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.enableDownloadProgress()
        }
    }
    
    // start the download progress
    
    func enableDownloadProgress() {
        
        UIView.transition(with: cancelButton, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.detailButton.layer.opacity = 0.4
            self.progressBar.isHidden = false
        }) { _ in
            self.recursiveProgressIncrementer()
        }
    }
    
    // Incrementing progress bar logic
    
    func recursiveProgressIncrementer() {
        
        if Int(percentageMultiplier.multiplier) == 1 {
            cancelButton.setTitle("✓", for: .normal)
            
            let dispatchTime = DispatchTime.now() + 0.25
            DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                self.displayPlayButton()
            }
        }
        else {
            NSLayoutConstraint.deactivate([self.percentageMultiplier])
            let newMultiplier = self.percentageMultiplier.multiplier + 0.1
            self.downloadProgressText.text = "\(Int(30 * newMultiplier)) / 30 MB"
            self.percentageMultiplier = self.progressBar.widthAnchor.constraint(equalTo: self.detailButton.widthAnchor, multiplier: newMultiplier)
            NSLayoutConstraint.activate([self.percentageMultiplier])
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .transitionCrossDissolve) {
                self.layoutIfNeeded()
            } completion: { _ in
                self.recursiveProgressIncrementer()
            }
        }
    }
    
    // Display PlayButton after the download progress completed
    
    func displayPlayButton() {
        UIView.transition(with: cancelButton, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.detailButton.isHidden = true
            self.progressBar.isHidden = true
            self.cancelButton.isHidden = true
        }) { _ in
            self.playButtonRightAnchor!.constant = -20
            self.playButtonLeftAnchor!.constant = 20
            self.playButtonConstraint!.isActive = false
            self.playButtonConstraint = self.playButton.topAnchor.constraint(equalTo: self.detailButton.topAnchor)
            self.playButtonConstraint!.isActive = true
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                self.layoutIfNeeded()
            }, completion: nil)
        }
        
    }
}
