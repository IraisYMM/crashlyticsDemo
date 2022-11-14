import UIKit

var greeting = "Hello, playground"
print(greeting)

//--------Pregunta 1
//is there a retain cycle in the following code -> ¿Hay un ciclo de retención en el siguiente código?
class Foo{
    var callbacks : [()-> Void] = []
    init(){
        callbacks.append(self.bar)
//        callbacks.append {
//            [weak self] in self?.bar()
//        }
//        callbacks.append {
//            [unowned self] in self.bar()
//        }
    }
    func bar(){}
}
//------ Pregunta 2
//given the following definition --> Dada la siguiente definicion
var Record : String
//func retriveData(for id: Int, completion: @escaping (Record) -> ())
//what is the difference bethween the following two calls to retriveData ---> ¿Cuál es la diferencia entre las siguientes dos llamadas a retriveData?
//retriveData(for: id){
//    self.update(with: $0)
//}

//retriveData(for: id, completion: {self.update(with: $0)})
//------- Pregunta 3
//can we store a custom object such as teh following one in user defaults?-->¿Podemos almacenar un objeto personalizado como el siguiente en los valores predeterminados del usuario?

//class User {
    let name: String
    let email : String
//}
//------- Pregunta 4
// Consider the following observer ( assume the . dowloadDidBegin constant is defined else where) --> Considere el siguiente observador (suponga que la constante . dowloadDidBegin se define en otro lugar)
class Observer: NSObject{
    override init(){
        super.init()
     //   NotificationCenter.default.addObserver(self,
     //                                          selector: #selector(downloadDidBegin),
    //                                           name: .downloadDidBegin,
   //                                            object: nil)
    }
    @objc func downloadDidBegin(_ note : Notification){
        print("Observer")
    }
}
// Consider the following observer ( assume the . dowloadDidBegin constant is defined else where)
//At some point in the past, an Observer was created on an arbitrary queue (not necesary the main queue)
//the observer still exists.
//Now consider the following code that may be run on any queue (not necessarily the main queue)

print("before")
//NotificationCenter.default.post(name: .downloadDidBegin, object: nil, userInfo: nil)
print("after")
//What is other of the output?


//------- Pregunta 5
// why wouldn´t this code work as expected --> ¿Por qué este código no funcionaría como se esperaba?
func downloadData (completion: (Data?) -> Void){
    var downloadedData : Data?
    let url = URL(string: "https://google.com")!
    let task = URLSession.shared.dataTask(with: url){ data, response,error in downloadedData = data
    }
    task.resume()
    completion(downloadedData)
}
//------- Pregunta 6
class MyObject: NSObject{
    private var timer: Timer!
    override init(){
        super.init()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            _ in self.update()
        }
    }
    deinit{
        timer.invalidate()
    }
    func update(){
    }
}
//------- Pregunta 7
let main = DispatchQueue(label: "main")
let background = DispatchQueue(label: "background")

main.async {
    print("1")
    background.sync{
        sleep(1)
        print("2")
        main.async {
            print("3")
        }
    }
    print("4")
}
//------- Pregunta 8
DispatchQueue.global().asyncAfter(deadline: .now() + 1){
    DispatchQueue.global().async {
        print("A")
    }
    print("B")
}
DispatchQueue.main.async {
    print("C")
}
print("D")
//------- Pregunta 9
//PREGUNTA
//------- Pregunta 10
extension Collection{
    func starts(with elem: Element) -> Bool{
        return self.first == self.elem
    }
}
[1,2,3].starts(with: 1)
//------- Pregunta 11
Protocol Audible{
    func makeSound()
}
extension Audible{
    func makeSound(){
        print("abstract sound*")
    }
}
struct Cat{}
extension Cat : Audible{
    func makeSound(){
        print("Meauw!")
    }
}
func speak(_ target: Audible){
    target.makeSound()
}
let audible : Audible = Cat()
speak(audible)
//------- Pregunta 12
struct Cat{
    var name : String
    let color : String
}
let x = \Cat.name
let y = \Cat.color
//------- Pregunta 13
//------- Pregunta 14
class C{
    let a : Int
    var b : Int
    init(a: Int, b: Int){
        self.a = a
        self.b = b
    }
}
let clet = C(a: 0, b: 0)
let cvar = C(a: 1, b: 1)
//------- Pregunta 15
class Foot{
    var d = Foot()
    var e = Foot()
    var f = e
    print(d === e, e === f)
}
//------- Pregunta 16
struct Person{
    var name: String
}
var p1 = Person(name: "Bart")
var p2 = p1
p1.name = "lisa"
print(p2.name)

//------- Pregunta 17
//------- Pregunta 18
class ViewController : UIViewController{
    private let id : Int
    deinit{
        print("#\(id)  deallocated")
    }
}
//------- Pregunta 19
class MyTableViewDelegate : NSObject, UITableViewDelegate{
    
}
class MyTableViewController: UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = MyTableViewDelegate()
        tableView.reloadData()
    }
}
//------- Pregunta 20
let container =  UIView()
let wrapped = UIView()

container.addSubview(wrapped)
container.translatesAutoresizingMaskIntoConstraints = false
container.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    container.widthAnchor.constraint(equalToConstant: 100),
    container.heightAnchor.constraint(equalToConstant: 200),
    wrapped.centerXAnchor.constraint(equalTo: container.centerXAnchor),
    wrapped.centerYAnchor.constraint(equalTo: container.centerYAnchor),
    wrapped.widthAnchor.constraint(equalToConstant: 50),
    wrapped.heightAnchor.constraint(equalToConstant: 50),
])
print(wrapped.frame)

