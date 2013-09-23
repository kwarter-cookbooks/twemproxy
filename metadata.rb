name              "twemproxy"
maintainer        "Daniel Koepke"
maintainer_email  "daniel.koepke@kwarter.com"
license           "All rights reserved"
description       "Installs twemproxy (a.k.a., nutcracker)"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

recipe "twemproxy", "Installs and configures twemproxy"

%w{ubuntu debian}.each do |os|
  supports os
end

depends "build-essential"
depends "ark", "~> 0.3"
