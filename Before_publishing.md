- [x] Separate `.gitignore`
- [x] `.` (`vim`) is reuse compliant
  - [x] Decide upon approach for `.msgok` files
  - [x] Decide upon documentation licence
  - [x] Licenses downloaded
  - [x] All files except spelling files comply
- [x] Move `spellfile` somewhere else
- Publish `vim_package` as an Ansible collection (detail below)
- Replace `playbooks/ansible.yaml` with instructions to install vim_package
- Add copyright and license, get `reuse` from the FSFE to pass
- Write a README
- Move to a separate repository
- Add CI to check `vim/site.yaml` succeeds on Debian and Alpine
- Remove rules for this repository from `../package.json`
- Add name and source to `.reuse/dep5`

# Publish vim_package as an Ansible collection

- `ansible-galaxy collection init`
- <https://docs.ansible.com/ansible/devel/dev_guide/developing_collections.html#building-collections>
- <https://docs.ansible.com/ansible/devel/dev_guide/developing_collections.html#trying-collections-locally>
- reuse compliant: MPL-2.0 and CC-BY-SA-4.0
- New repository on GitHub
- Decide how to publish? GitHub? Ansible Galaxy?

Then

- <https://docs.ansible.com/ansible/devel/dev_guide/developing_collections.html#publishing-collections>
  <https://docs.ansible.com/ansible/devel/dev_guide/developing_collections.html#upload-collection-galaxy>

Or

- add a GitHub action that will upload a `.tar.gz` as a release

<!--
Before_publishing.md
Copyright 2020 Keith Maxwell
SPDX-License-Identifier: CC-BY-SA-4.0
-->
