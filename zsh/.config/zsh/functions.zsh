# Creates a folder and opens it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Quick file backup
bak() {
  cp "$1" "$1.bak"
}
