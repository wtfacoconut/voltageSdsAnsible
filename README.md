#  Voltage SDS 2022.08: <br/>Ansible deployment for single node
---
##  Summary
This document is here to detail the requirements and process of running Mike Snowden's Ansible deployment script for Voltage SDS 2022.08.
---
## Requirements:
- Lab VM hardware requirements:
    - CPU: 4 cores (8 recommended)
    - RAM: 16GB RAM (32 recommended)
    - Storage: 1 disk @ 100GB (250GB recommended)
    - Networking: 1 NIC (with internet access)
    - OS: Ubuntu Server 22.04 LTS
    - Required software dependencies:
        - Python 3 (the Ansible script will install the rest of the required software dependencies)
---
# Commands to run:

##  **Step 0**: Pre-flight checks and setup

### **Step 0.1** - Getting the Ansible scripts:
Get a copy of the ansible scripts copied on to your VM. You could manually copy it into the VM, but the easiest way is to use git:
```
git clone https://github.com/wtfacoconut/voltageSdsAnsible.git; chmod +x voltageSdsAnsible/bootstrap.sh; $(pwd)/voltageSdsAnsible/bootstrap.sh
```

### **Step 0.2** - Copying over the Voltage SDS installation files:
**MANUAL STEP:** Copy `sd-local-deps-release-2022.08.sh`, `sds-release-2022.08.sh`, and `sds-release-2022.08-containers.tar.gz` into the same directory as the ansible script.

### **Step 0.3** - Running the resource requirements check Ansible script:
First, run the `step-0` playbook, command below, to see if your VM meets the minimum recommended system requirements. Please read any warnings produced.
```
set ANSIBLE_COLOR_OK=red || ansible-playbook --ask-become-pass step-0.yaml || unset ANSIBLE_COLOR_OK;
```

---
##  **Step 1**: Installing some pre-requisites & setting up env vars

Run the `step-1` ansible script below:
**NOTE:** When prompted for the `BECOME password:`, provide the password that you'd typically use with `sudo`.
```
ansible-playbook --ask-become-pass step-1.yaml;
```

**Optional verification step:**
As a verification step, we can check if some important environment variables were setup correctly:
```
source ~/.bashrc && echo "NS_MY_SDS_LAB=$NS_MY_SDS_LAB   NS_SDS_RELEASE=$NS_SDS_RELEASE   NS_SD_LOCAL_DEPS=$NS_SD_LOCAL_DEPS   RN_SDS_RELEASE=$RN_SDS_RELEASE   RN_SD_LOCAL_DEPS=$RN_SD_LOCAL_DEPS";
```

If in the `PLAY RECAP` summary it says that `failed=0 `, then proceed to reboot your system.
```
sudo reboot;
```
---

## **Step 2**:
Then run the `step-2` ansible script below:
**NOTE:** When prompted for the `BECOME password:`, provide the password that you'd typically use with `sudo`.
```
ansible-playbook --ask-become-pass step-2.yaml;
```
If in the `PLAY RECAP` summary it says that `failed=0 `, then proceed to reboot your system.
```
sudo reboot;
```
---

## **Step 3**:
Then run the `step-3` ansible script below:
**NOTE:** When prompted for the `BECOME password:`, provide the password that you'd typically use with `sudo`.
```
ansible-playbook --ask-become-pass step-3.yaml;
```
If in the `PLAY RECAP` summary it says that `failed=0 `, then :
-  Update the hosts file on your local machine where you have a browser for your Voltage SDS instance.
-  Finally, open  your web browser and navigate to yout SDS management concole at "https://"
