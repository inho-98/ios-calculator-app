//
//  Calculator - ViewController.swift
//  Created by inho.
//  Copyright © yagom. All rights reserved.
//

import Foundation

class CalculatorItemQueue<T>: CalculateItem {
    private(set) var head: Node<T>? = nil
    var last: Node<T>? {
        if head == nil {
            return nil
        } else {
            var node = head
            while node?.next != nil {
                node = node?.next
            }
            return node
        }
    }
    var isEmpty: Bool {
        if head == nil && last == nil {
            return true
        } else {
            return false
        }
    }
    
    func enqueue(element: T) {
        guard let lastNode = last else {
            head = Node(data: element)
            return
        }
        
        lastNode.next = Node(data: element)
    }
    
    @discardableResult
    func dequeue() -> T? {
        guard let currentHead = head else {
            return nil
        }
        
        head = currentHead.next
        return currentHead.data
    }
    
    func removeAll() {
        guard head != nil else {
            return
        }
        
        head = nil
    }
}

