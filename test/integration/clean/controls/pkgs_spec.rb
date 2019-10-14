#
# pkgs_spec.rb -- Libvirt packages InSpec control
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright © 2019 Pôle de Compétences Logiciels Libres <eole@ac-dijon.fr>
#
packages = libvirt.packages

control 'Libvirt packages' do
  title 'must be uninstalled'

  packages.each do |service, pkgs|
    pkgs.each do |pkg|
      describe package(pkg) do
        it { should_not be_installed }
      end
    end
  end

end
