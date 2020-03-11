- ~~Review and move all of `roles/script/files/`~~
- ~~Convert `roles/script/` to a tasks include~~
- ~~Move `playbooks/vim.yaml` to `vim/site.yaml`~~
- Publish `vim_package` as an Ansible collection
- Replace `playbooks/ansible.yaml` with instructions to install vim_package
- Move `spellfile` somewhere else
- Add copyright and license, get `reuse` from the FSFE to pass
- Write a README
- Move to a separate repository

# Publish vim_package as an Ansible collection

- New repository on GitHub
- `ansible-galaxy collection init`
- reuse compliant: MPL-2.0 and CC-BY-SA-4.0
- add a GitHub action that will upload a `.tar.gz` as a release
- playbooks/ansible.
