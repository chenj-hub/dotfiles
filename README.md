# dotfiles setup

## Run ansible locally

Setup home machines
```bash
$ ./ansible_wrapper.sh ansible-playbook dotfiles.yml --ask-become-pass
```

Setup work machines
```bash
$ ./ansible_wrapper.sh ansible-playbook dotfiles.yml --ask-become-pass --extra-vars="work=true"
```

## Development

Check playbook

```bash
$ ./ansible_wrapper.sh ansible-playbook dotfiles.yml --check --ask-become-pass
```

Use ansible-lint for styling

```bash
$ ./ansible_wrapper.sh ansible-lint --fix
```

Update requirements.txt

```bash
$ uv pip freeze > requirements.txt
```
