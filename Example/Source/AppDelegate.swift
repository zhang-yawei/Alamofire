//
//  AppDelegate.swift
//
//  Copyright (c) 2014-2016 Alamofire Software Foundation (http://alamofire.org/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit


// 类似main函数
@UIApplicationMain

/*1. 结构体为值类型,所以一个结构体常量的属性是不能修改的,哪怕这个属性是一个变量属性
  2. 属于引用类型的类（class）则不一样。把一个引用类型的实例赋给一个常量后，仍然可以修改该实例的变量属性。
  3. swift中没有 属性对应的实例变量,只有属性.
  4.属性观察期
 

 
 */



/* 协议
 1. 父类应该写在协议之前.
 2. 结构体也可以遵循协议
 3. 协议可以定义属性, {get set} 指定读写 定义类型属性或者类型方法,使用static关键字
 4.
 
 
 
 */
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    // 可选UIWindow  
    
    /**
     可选类型,如果有值为UIWindow的实例,如果没值,是nil
     如果初始化的时候,没有赋值,为nil
     nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
     
     Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。
     
    */
    var window: UIWindow?

    // MARK: - UIApplicationDelegate
    

    // didFinishLaunchingWithOptions 参数标签   argument label   或者参数的外部名称
    // 默认情况下,函数使用参数名称作为参数标签.
    // 如果你不希望为某个参数添加一个标签，可以使用一个下划线(_)来代替一个明确的参数标签。
     // 如果一个参数有一个标签，那么在调用的时候必须使用标签来标记这个参数。
    
    
    // is 检查对象是否为某个类的实例 
    // as 类型转化  as? 返回可选类型  as! 强制转化,如果为nil,则发生运行时错误
    
    //Any 可以表示任何类型，包括函数类型。
    // AnyObject 可以表示任何类类型的实例。
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]?)
        -> Bool
    {
        
        // window! 可选类型的强制解析来获得可选类型的值.如果可选类型的值为nil,强制解析会出错.所以在强制解析之前,请先判断
        let splitViewController = window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers.last as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
    
        
        
        return true
    }

    // MARK: - UISplitViewControllerDelegate

    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController)
        -> Bool
    {
        if
            let secondaryAsNavController = secondaryViewController as? UINavigationController,
            let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController
        {
            return topAsDetailController.request == nil
        }

        return false
    }
}
