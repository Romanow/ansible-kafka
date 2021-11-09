# Ansible

### Настройка
1. В файле `.vault_pass` лежит пароль от ansible vault.
1. Для корректной работы ansible лучше использовать virtualenv:
    ```shell script
    virtualenv -p /usr/local/bin/python3 ~/.local
    . ~/.local/bin/activate
    ```
1. Установить необходимые зависимости:
    ```shell script
    pip install -r requirements.txt
    ```
   
### Запуск playbook

#### Local inventory

```shell
ansible-playbook -i inventories/local/static.yml --vault-password-file=.vault_pass kafka.yml
```

#### DigitalOcean inventory

```shell
export DO_API_TOKEN=<DigitalOcean Token>
ansible-playbook -i inventories/digitalocean/digital_ocean.py --vault-password-file=.vault_pass kafka.yml
```