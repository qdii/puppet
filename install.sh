#!/bin/bash

echo "node 'default' {
  include qdii
}" >> /etc/puppetlabs/puppet/manifests/site.pp

puppet module install puppetlabs-docker
