class ruby(
  $version = '1.9',
) {

  case $version {
    '1.9': { include ruby::ruby_19 }
    '1.8': { include ruby::ruby_18 }
  }

}
