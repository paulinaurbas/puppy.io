# Puppy.io Backend

## Develop it locally

To prepare your shell for development run:
```sh
virtualenv .env
source .env/bin/activate
pip install -r requirements.txt
```

To run unit tests run:
```sh
pytest
```

To run the app locally run:
```sh
export FLASK_APP=app.py
flask run

# or
gunicorn app:app --log-level=info
```

Before creatin PR, update the `requirements.txt` file and the `runtime.txt` file!
> Keep the requirements.txt as minimal as possible
```sh
pip freeze > requirements.txt

# Check the Python version to update the runtime.txt file
python -V
```

## Host it on Heroku

To push commited hanges to Heroku run:

```sh
git subtree push --prefix backend heroku master
```

To recreate Heroku app in case of some crush or bad master branch rebase run:

```sh
heroku create # After that rename created app to "puppy-io-backend" in the Heroku dashboard
git remote rm heroku # Only if you already have heroku remote in the repository
heroku git:remote -a puppy-io-backend #
git subtree push --prefix backend heroku  master
```