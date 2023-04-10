# -----------------------------------------------------------------------------
# OSX/UNIX/MISC
# Sources:
# https://github.com/guarinogabriel/mac-cli
# -----------------------------------------------------------------------------

# Shorthand
alias la="ls -hAlt"
alias lah="ls -lAh"
alias ax="chmod a+x"

# Create a certificate key and CSR.
# The server provided is only used to help set file names.
# Example: $ gen-csr example.com
function gen-csr {
  openssl genrsa -aes256 -passout pass:discarded -out ${1:-server}.locked.key 2048 && \
  openssl rsa -in ${1:-server}.locked.key -passin pass:discarded -out ${1:-server}.key && \
  rm ${1:-server}.locked.key && \
  openssl req -nodes -new -key ${1:-server}.key -out ${1:-server}.csr
}

# Convenience function for opening an s_client session with the server in $1
# Example: $ sc example.com
function sc {
  openssl s_client -connect $1:443 -servername $1 "${@:2}"
}

# Update Homebrew, packages, and clean up old trash
function brew-sync {
  brew update
  brew upgrade
  brew cleanup -s
  brew cask cleanup
  brew prune
}

# Find biggest directories in current directory
function find-biggest-directories {
  find . -type d -print0 | xargs -0 du | sort -n | tail -20 | cut -f2 | xargs -I{} du -sh {}
}

# Find biggest files in current directory
function find-biggest-files {
  find . -type f -print0 | xargs -0 du | sort -n | tail -20 | cut -f2 | xargs -I{} du -sh {}
}

# Find all files below the current directory with a given string in their name
function find-name {
  find . -maxdepth 100 -name "*$1*" -print
}

# Lock the screen in OS X
function lock {
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
}

# Moves all files in subdirectories of this directory up to the current level
function flatten-cwd {
  find . -mindepth 2 -type f -exec mv -i '{}' . ';'
}

# Create and cd to a directory
function mcd {
  mkdir -p "$1" && cd "$1"
}

# Touch and open a file
function topen {
  touch "$1" && $EDITOR "$1"
}

# Print your LAN IPv4 address
function localip {
  (awk '{print $2}' <(ifconfig en0 | grep 'inet '))
}

# Print your LAN IPv6 address
function localipv6 {
  (awk '{print $2}' <(ifconfig en0 | grep 'inet6 '))
}

# Print your public IPv4 address
function publicip {
  curl -s https://ipinfo.io/ip
}

# Removes duplicates from the "Open With" menu in OS X
# http://bit.ly/eF8UHG
function fix-launch-services {
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && \
  killall Finder
}