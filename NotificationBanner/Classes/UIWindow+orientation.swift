//
//  UIWindow+orientation.swift
//  NotificationBannerSwift
//
//  Created by gabmarfer on 15/10/2019.
//

import UIKit

extension UIWindow {

    public var width: CGFloat {
        if #available(iOS 13.0, *) {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let orientation = UIApplication.shared.supportedInterfaceOrientations(for: scene.windows.first)
                switch orientation {
                case .landscapeLeft, .landscapeRight:
                    return max(frame.width, frame.height)
                case .portrait, .portraitUpsideDown:
                    return min(frame.width, frame.height)
                default:
                    return frame.width
                }
            } else {
                return getDefaultWidth()
            }
        } else {
            return getDefaultWidth()
        }

        func getDefaultWidth() -> CGFloat {
            let orientation = UIDevice.current.orientation
            switch orientation {
            case .landscapeLeft, .landscapeRight:
                return max(frame.width, frame.height)
            case .portrait, .portraitUpsideDown:
                return min(frame.width, frame.height)
            default:
                return frame.width
            }
        }
    }

    public var height: CGFloat {
        if #available(iOS 13.0, *) {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let orientation = UIApplication.shared.supportedInterfaceOrientations(for: scene.windows.first)
                switch orientation {
                case .landscapeLeft, .landscapeRight:
                    return min(frame.width, frame.height)
                case .portrait, .portraitUpsideDown:
                    return max(frame.width, frame.height)
                default:
                    return frame.height
                }
            } else {
                return getDefaultHeight()
            }
        } else {
            return getDefaultHeight()
        }

        func getDefaultHeight() -> CGFloat {
            let orientation = UIDevice.current.orientation
            switch orientation {
            case .landscapeLeft, .landscapeRight:
                return min(frame.width, frame.height)
            case .portrait, .portraitUpsideDown:
                return max(frame.width, frame.height)
            default:
                return frame.height
            }
        }
    }
}
