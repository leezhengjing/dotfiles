function cat --description 'Use bat instead of cat'
  bat --theme=(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub) $argv
end
