//
//  ZoomView.swift
//  ZoomView
//
//  Created by developer mg on 13/04/2023.
//

import SwiftUI
import UIKit

class CustomImageView: UIView, UIGestureRecognizerDelegate {
    var image: UIImage? {
        didSet {
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
        }
    }
    
    private let imageView = UIImageView()
    private let initialWidth: CGFloat = 300
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: initialWidth),
        ])
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        pinchGesture.delegate = self
        addGestureRecognizer(pinchGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.minimumNumberOfTouches = 2
        panGesture.maximumNumberOfTouches = 2
        panGesture.delegate = self
        addGestureRecognizer(panGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotationGesture(_:)))
        rotationGesture.delegate = self
        addGestureRecognizer(rotationGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePinchGesture(_ recognizer: UIPinchGestureRecognizer) {
        imageView.transform = imageView.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
        recognizer.scale = 1.0
    }
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self)
        imageView.transform = imageView.transform.translatedBy(x: translation.x, y: translation.y)
        recognizer.setTranslation(.zero, in: self)
    }
    
    @objc func handleRotationGesture(_ recognizer: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: recognizer.rotation)
        recognizer.rotation = 0
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

struct ZoomAndPanAndRotationView: UIViewRepresentable {
    var image: UIImage
    
    func makeUIView(context: Context) -> CustomImageView {
        let customImageView = CustomImageView()
        customImageView.image = image
        return customImageView
    }
    
    func updateUIView(_ uiView: CustomImageView, context: Context) {
        uiView.image = image
    }
}



