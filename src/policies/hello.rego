package policies.hello

# default to a "closed" system, only grant accesss when explicitly granted
default allowed = false
default visible = false
default enabled = false

allowed {
    input.role == "web-admin"
}

enabled {
    visible
}

visible {
    input.app == "web-console"
}
