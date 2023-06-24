import Cocoa

class Animal {
    let legs: Int
    
    init (legs: Int) {
        self.legs = legs
    }
    
    func speak() {}
}

class Dog: Animal {
    init () {
        super.init(legs: 4)
    }
    
    override func speak() {
        print("Bow Bow")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init (tamed: Bool) {
        self.isTame = tamed
        
        super.init(legs: 4)
    }
    
    override func speak() {
        print("Meow Meow")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Booow Boow")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Grr Grr")
    }
}

class Persian: Cat {
    init() {
        super.init(tamed: true)
    }
    
    override func speak() {
        print("Meeow Meeow")
    }
}

class Lion: Cat {
    init() {
        super.init(tamed: false)
    }
    
    override func speak() {
        print("Roar Roar")
    }
}
