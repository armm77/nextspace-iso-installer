# version=DEVEL
# Fedora Linux 42 Kickstart

# Use graphical install
graphical

# After install
reboot --eject

# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'

# System language
lang en_US.UTF-8

# System timezone
timezone America/New_York --utc

# Network information
network  --bootproto=dhcp --device=ens160 --ipv6=auto --activate
network  --hostname=nextspace

# Run the Setup Agent on first boot
firstboot --enable

# Accept END USER License Agreement
eula --agreed

# Create New User add Wheel Group
user --name=me --groups=wheel,audio --homedir=/Users/me --shell=/bin/zsh --password=nextspace

# SELinux Mode
selinux --permissive

%packages
# Minimal Installation
@^server-product-environment
%end

%addon com_redhat_kdump --enable --reserve-mb='auto'
%end

%post
# NEXTSPACE Installation and Tools
/usr/bin/dnf -y update
/usr/bin/dnf -y install rsync
/usr/bin/dnf -y install xorg-x11-drivers
/usr/bin/dnf -y install xorg-x11-xinit
/usr/bin/dnf -y install libdispatch-devel
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSUser/libcorefoundation-5.9.2-1.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSDeveloper/libcorefoundation-devel-5.9.2-1.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSUser/libobjc2-2.2.1-0.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSDeveloper/libobjc2-devel-2.2.1-0.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSUser/nextspace-core-0.95-12.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSDeveloper/nextspace-core-devel-0.95-12.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSUser/libwraster-7.0.1-0.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSDeveloper/libwraster-devel-7.0.1-0.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSUser/nextspace-gnustep-1.31.1_0.32.0-1.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSDeveloper/nextspace-gnustep-devel-1.31.1_0.32.0-1.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSUser/nextspace-frameworks-0.95-0.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSDeveloper/nextspace-frameworks-devel-0.95-0.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSUser/nextspace-applications-0.95-0.fc42.x86_64.rpm
/usr/bin/dnf -y install https://github.com/armm77/nextspace-packages/raw/main/nextspace/NSDeveloper/nextspace-applications-devel-0.95-0.fc42.x86_64.rpm
/usr/bin/ldconfig
/usr/bin/rsync -a /etc/skel/ /Users/me/
/bin/chown -R me:me /Users/me/
/usr/sbin/restorecon -R /Users 2>&1 > /dev/null
/usr/bin/systemctl set-default graphical.target
%end
