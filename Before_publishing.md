- ~~Remove include `import_tasks: ../tasks/backup.yaml` from `vim/site.yaml`~~
- Publish `vim_package` as an Ansible collection
- Replace `playbooks/ansible.yaml` with instructions to install vim_package
- Move `spellfile` somewhere else
- Add copyright and license, get `reuse` from the FSFE to pass
- Write a README
- Move to a separate repository
- Add CI to check `vim/site.yaml` succeeds on Debian and Alpine
- Remove rules for this repository from `../package.json`

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
