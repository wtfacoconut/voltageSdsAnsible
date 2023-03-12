<style>
code{
    background-color:lavender;
}

.indent-l1 {
  margin-left: 1em;
}
</style>
#  Voltage SDS 2022.08: <br/>Ansible deployment for single node
<p/>
***
##  Summary
This document is here to detail the requirements and process of running Mike Snowden's Ansible deployment script for Voltage SDS 2022.08.
<p/>
***
## Requirements:
- Lab VM hardware requirements:
    - CPU: 4 cores (8 recommended)
    - RAM: 16GB RAM (32 recommended)
    - Storage: 1 disk @ 100GB (250GB recommended)
    - Networking: 1 NIC (with internet access)
    - OS: Ubuntu Server 22.04 LTS
    - Required software dependencies:
        - Python 3 (the Ansible script will install the rest of the required software dependencies)

<p/>
***
# Commands to run:
<p/>
<p/>
##  **Step 0**: Pre-flight checks and setup
<p/>

### **Step 0.1** - Getting the Ansible scripts:
<div class="indent-l1">
Get a copy of the ansible scripts copied on to your VM. You could manually copy it into the VM, but the easiest way is to use git:
<div style="background-color:antiquewhite;">
```bash
git clone ...
```
</div>
</div>
<p/>

### **Step 0.2** - Copying over the Voltage SDS installation files:
<div class="indent-l1">
**MANUAL STEP:** Copy `sd-local-deps-release-2022.08.sh`, `sds-release-2022.08.sh`, and `sds-release-2022.08-containers.tar.gz` into the same directory as the ansible script.
</div>
<p/>

### **Step 0.3** - Running the resource requirements check Ansible script:
<div class="indent-l1">
First, run the `step-0` playbook, command below, to see if your VM meets the minimum recommended system requirements. Please read any warnings produced.
<div style="background-color:antiquewhite;">
```bash
set ANSIBLE_COLOR_OK=red || ansible-playbook --ask-become-pass step-0.yaml || unset ANSIBLE_COLOR_OK;
```
</div>
</div>
<p/>
***

##  **Step 1**: Installing some pre-requisites & setting up env vars
<div class="indent-l1">
Run the `step-1` ansible script below:
**NOTE:** When prompted for the `BECOME password:`, provide the password that you'd typically use with `sudo`.
<div style="background-color:antiquewhite;">
```bash
ansible-playbook --ask-become-pass step-1.yaml;
```
</div>

<p/>
<details style="background-color:powderblue;">
  <summary>Optional verification step</summary>
As a verification step, we can check if some important environment variables were setup correctly:
<div style="background-color:paleturquoise;">
```bash
source ~/.bashrc && echo "NS_MY_SDS_LAB=$NS_MY_SDS_LAB   NS_SDS_RELEASE=$NS_SDS_RELEASE   NS_SD_LOCAL_DEPS=$NS_SD_LOCAL_DEPS   RN_SDS_RELEASE=$RN_SDS_RELEASE   RN_SD_LOCAL_DEPS=$RN_SD_LOCAL_DEPS";
```
</div>
</details>
<p/>

If in the `PLAY RECAP` summary it says that `failed=0 `, then proceed to reboot your system.
<div style="background-color:antiquewhite;">
```bash
sudo reboot;
```
</div>
</div>
<p/>
***

## **Step 2**:
Then run the `step-2` ansible script below:
**NOTE:** When prompted for the `BECOME password:`, provide the password that you'd typically use with `sudo`.
<div style="background-color:antiquewhite;">
```bash
ansible-playbook --ask-become-pass step-2.yaml;
```
</div>
<p/>
***

## **Step 3**:
Then run the `step-3` ansible script below:
**NOTE:** When prompted for the `BECOME password:`, provide the password that you'd typically use with `sudo`.
<div style="background-color:antiquewhite;">
```bash

```
</div>
<p/>