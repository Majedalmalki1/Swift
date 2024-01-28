func Markdown(txt: String, mark: String) -> String {
    switch mark {
    case "h1":
        return "#\(txt)"
    case "h2":
        return "##\(txt)"
    case "h3":
        return "###\(txt)"
    case "code":
        return "'\(txt)'"
    case "bold":
        return "***\(txt)***"
    case "bq":
        return "> \(txt)"
    default:
        return txt
    }
}

print(Markdown(txt: "Hello, World!",mark:  "h2"))
