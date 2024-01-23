```
func countWords(txt: String) -> Int {
    let words = txt.split(separator: " ")
    print(words)
    return words.count
}


print(countWords(txt: "Plant hope in the hearts of others"))

----------------------------
func is_same(name1: String, name2: String) -> String {
    if (name1 == name2){
        return "متشابهين"
    }else{
        return "غير متشابهين"
    }
    }


print(is_same(name1:"Anas",name2:"anas")) 

----------------------------

func logical_and(a: Bool, b: Bool) -> Bool {
    if (a && b) {
        return true
    } else {
        return false
    }
}

print(logical_and(a: true, b: true))

----------------------------

func area_of_rectangle(width: Int, height: Int) -> Int {
    let area = width * height 
    return area
    }
    print(area_of_rectangle(width: 4 , height: 2 ))

----------------------------

func deleteLastChar(input: String) -> String {
        let modifiedString = String(input.dropLast())
        return modifiedString
}


let original = "CoderHub"
let stringWithoutLastChar = deleteLastChar(input: original)

print("Original String: \(original)")
print("String without Last Character: \(stringWithoutLastChar)")

----------------------------

func countWords(txt: String) -> Int {
    let count = txt.count 
    return count
    }
print(countWords(txt: "Keep smiling")) 

```
