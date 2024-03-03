#!/usr/bin/env bash

main() {
    apt install -y nala vim

    replace_sources
    no_subscription_nag
    disable_ha

    change_to_zsh

    install_helpers
}


replace_sources() {
  VERSION="$(awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release)"

    start_task "Correcting Proxmox VE Sources"
    cat <<EOF >/etc/apt/sources.list
deb http://deb.debian.org/debian ${VERSION} main contrib
deb http://deb.debian.org/debian ${VERSION}-updates main contrib
deb http://security.debian.org/debian-security ${VERSION}-security main contrib
EOF
end_task
    start_task "Dropping enterprise sources"
cat <<EOF >/etc/apt/sources.list.d/pve-enterprise.list
# deb https://enterprise.proxmox.com/debian/pve ${VERSION} pve-enterprise
EOF
    end_task

start_task "adding no-subscription sources"
    cat <<EOF >/etc/apt/sources.list.d/pve-install-repo.list
deb http://download.proxmox.com/debian/pve ${VERSION} pve-no-subscription
EOF
end_task

start_task "disable ceph"
    sed -i  "s/^\([^#]\)/#\1/g" /etc/apt/sources.list.d/ceph.list
end_task

end_task
start_task "apt update"

apt update
end_task

}

no_subscription_nag() {
    start_task "Disabling subscription nag "
    echo "DPkg::Post-Invoke { \"dpkg -V proxmox-widget-toolkit | grep -q '/proxmoxlib\.js$'; if [ \$? -eq 1 ]; then { echo 'Removing subscription nag from UI...'; sed -i '/.*data\.status.*{/{s/\!//;s/active/NoMoreNagging/}' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js; }; fi\"; };" >/etc/apt/apt.conf.d/no-nag-script
    apt --reinstall install proxmox-widget-toolkit &>/dev/null
    end_task 

}

disable_ha() {

      start_task "Disabling high availability"
      systemctl disable -q --now pve-ha-lrm
      systemctl disable -q --now pve-ha-crm
      systemctl disable -q --now corosync
      end_task "Disabled high availability"

}


change_to_zsh() {
    start_task "install zsh"
    nala install -y zsh
    end_task

    start_task "choose as default zsh"
    chsh -s /bin/zsh
    end_task

}



install_helpers() {
    nala install -y tree ripgrep
}


# ----- Utils
start_task() {
  printf "🚧 $(tput setaf 8)[%s]$(tput sgr0) %s ... " "$(date +%H:%M:%S)" "$@"
}

end_task() {
  printf "✅ \n"
}

skip_task() {
  printf "☑️ \n"
}

print_warning() {
  echo "⚠️  $(tput bold)$(tput setaf 3)$@$(tput sgr0) ⚠️ "
}

print_info() {
  echo "$(tput bold)$(tput setaf 4)$@$(tput sgr0)"
}

print_success() {
  printf "\n$(tput bold)$(tput setaf 2)%s$(tput sgr0)" "$@"
}


if ! command -v pveversion >/dev/null 2>&1; then
    print_warning "\n No PVE Detected!\n"
    exit
fi

main

