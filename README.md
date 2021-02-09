# Temporary development PyPI Server

## Usage

Start the server:

```
make run
```

### Setup credentials for pip

Edit `~/.pypirc` and use `pypi`/`pypi` as the credentials:

```
[distutils]
index-servers =
    private

[private]
repository: http://localhost:8080
username:pypi
password:pypi
```

### Push artifacts

Next, you should be able to go into any Python project with a valid
`setup.py` file and run:

```
python setup.py sdist upload -r private
```

## Modifications

### Add other users

Run this to add a user with username `NEWUSERNAME`.

```bash
htpasswd -s .htpasswd NEWUSERNAME
```