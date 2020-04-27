//
//  Nib.swift
//  SnapshotTest
//
//  Created by devKai on 27/4/2563 BE.
//  Copyright © 2563 snapshot. All rights reserved.
//

import UIKit

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

public extension NibLoadableView {
    private static func bundle() -> Bundle {
        let bundle = Bundle(for: Self.self)
        return bundle
    }

    fileprivate static func nib() -> UINib {
        let nibName = Self.nibName
        let nib = UINib(nibName: nibName, bundle: bundle())
        return nib
    }

    static func loadNib() -> Self {
        let classes = nib().instantiate(withOwner: nil, options: nil)
        return classes.first as! Self
    }

    static func instanceFromNib() -> UIView {
        return nib().instantiate(withOwner: self, options: nil).first as! UIView
    }
}

extension UIView: NibLoadableView {}

public protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

public extension UITableView {
    func register<T: UITableViewCell>(cellClass: T.Type)
        where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UITableViewCell>(nibCellClass: T.Type)
        where T: ReusableView {
        register(T.nib(), forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UITableViewHeaderFooterView>(headerFooterClass: T.Type)
        where T: ReusableView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UITableViewHeaderFooterView>(nibHeaderFooterClass: T.Type)
        where T: ReusableView {
        register(T.nib(), forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T
        where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier,
                                             for: indexPath) as? T
        else {
            fatalError("Could not dequeue cell \(T.self) with identifier \(T.defaultReuseIdentifier)")
        }

        return cell
    }
}
