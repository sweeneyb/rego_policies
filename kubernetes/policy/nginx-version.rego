package main

allowed_tags = [
    "nginx:1.14.2"
]

contains ( allowed, subject) = true {
    allowed[_] = subject
}


deny_any_image_missing[msg] {
    some i
    val := input.spec.template.spec.containers[i]
    not val.image
    msg := "Please don't leave the image blank"
}


warn[msg] {
    some i
    val := input.spec.template.spec.containers[i]
    not contains(allowed_tags, val.image)
    msg = sprintf("Found an old/disallowed nginx image\"%s\". Please update.", [val.image])
}