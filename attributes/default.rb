default[:apt][:packages] = [
  { name: "phantomjs" }
]
default[:apt][:repositories] = [
  {
    name: "phantomjs",
    uri: "ppa:tanguy-patte/phantomjs",
    distribution: "trusty"
  }
]
