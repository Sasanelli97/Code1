#!/bin/bash

# Kali Linux Installation Script
# This script configures a Kali Linux system inside chroot

set -e

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

# Set hostname
echo "kali" > /etc/hostname

# Configure hosts file
cat > /etc/hosts << EOF
127.0.0.1 localhost
127.0.1.1 kali

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF

# Configure timezone
ln -sf /usr/share/zoneinfo/UTC /etc/localtime

# Configure locale
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8

# Install Kali Linux specific packages
apt update
apt install -y \
    linux-image-amd64 \
    linux-headers-amd64 \
    initramfs-tools \
    grub-efi-amd64 \
    network-manager \
    systemd \
    sudo \
    vim \
    curl \
    wget \
    git \
    build-essential \
    kali-linux-default \
    kali-desktop-gnome \
    kali-tools-top10 \
    kali-tools-passwords \
    kali-tools-web \
    kali-tools-windows-resources \
    kali-tools-information-gathering \
    kali-tools-vulnerability \
    kali-tools-wireless \
    kali-tools-reverse-engineering \
    kali-tools-exploitation \
    kali-tools-social-engineering \
    kali-tools-sniffing-spoofing \
    kali-tools-reporting

# Configure user
useradd -m -s /bin/bash kali
usermod -aG sudo kali
echo "kali:kali" | chpasswd

# Configure sudo
echo "kali ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/kali-user

# Configure network
systemctl enable NetworkManager

# Configure display manager
systemctl enable gdm3

# Install kernel and generate initramfs
update-initramfs -u

# Configure GRUB
update-grub

log "Kali Linux installation completed"