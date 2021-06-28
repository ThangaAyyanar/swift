// Generic Stack 

class Stack<T> {
    
    private class Node<T> {
        
        var data: T
        var prev: Node?
        
        init(data:T) {
            
            self.data = data
        }
    }
    
    private var tail: Node<T>?
    
    func push(data: T){
        
        var newNode = Node(data: data)
        
        if tail == nil {
            
            tail = newNode
        }
        else{
            
            newNode.prev = tail
            tail = newNode
        }
    }
    
    func pop() -> T? {
        
        if let data = tail?.data {
            
            tail = tail?.prev
            return data
        }
        return nil
    }
    
    func debug(){
        
        var tempList = tail
        while tempList != nil {
            
            print("\(tempList!.data) \t")
            tempList = tempList?.prev
        }
    }
}


let intStack = Stack<Int>()
intStack.push(data: 34)
intStack.push(data: 44)

intStack.debug()
//intStack.pop()
//intStack.pop()

