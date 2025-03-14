# dotfiles setup 

## Run ansible locally

```
./ansible_wrapper.sh ansible-playbook dotfiles.yml --ask-become-pass
```

## Development

Use ansible-lint for styling

```
./ansible_wrapper.sh ansible-lint autofix
```

Update requirements.txt

```
uv pip freeze > requirements.txt 
```
