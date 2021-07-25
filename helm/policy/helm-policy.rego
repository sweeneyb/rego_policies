package main

allowed_tags = [
    "v11",
    "v10"
]

contains ( allowed, subject) = true {
    allowed[_] = subject
}


deny_any_port_missing[msg] {
    not input.sidecar.port
    msg := "Please don't leave off the port"
}

deny_sidecar_port_empty[msg] {
    input.sidecar.port == null
    msg := "Please don't leave the port empty"
}

deny_sidecar_port_empty[msg] {
    input.sidecar.port < 1024
    msg := "Please use non-privileged ports"
}

warn[msg] {
    not input.sidecar.tag
    msg := "Please include a sidecar.tag"
}
warn[msg] {
    not contains(allowed_tags, input.sidecar.tag)
    msg = sprintf("Found an old/disallowed sidecar image\"%s\". Please update.", [input.sidecar.tag])
}