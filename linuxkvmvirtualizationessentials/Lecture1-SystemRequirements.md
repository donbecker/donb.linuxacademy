* Using Fedora22, i7 processor, 32GB RAM
* cpu info
    * `cat /proc/cpuinfo`
* cpu flags
    * svm: amd processor with virtualization extensions
    * vmx: intel processor with virtualization extensions
    * 1m: 64bit processor
    * `grep --color -Ew 'svm|vmx|1m' /proc/cpuinfo
* list kvm modules
    * `lsmod | grep kvm`
    * if kvm isn't listed, enable virtualization & virtualization extensions in bios and reboot
    * if kvm still isn't listed, load modules 
        * `modprobe kvm kvm_intel`
* cpu cores
    * when counting cores, count actual cores only, not hyper-thread cores
    * for prod/server env's use one core per virtual cpu
    * general cpu info
        * `lscpu`
* memory
    * 2GB ram for hypervisor
    * list memory
        * `free -m`
    * calculate swap space
        * 32GB RAM * .5 overcommit + 8 = 24GB swap
    
