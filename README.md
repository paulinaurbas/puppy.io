<h3 align="center">Puppy.io</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/kylelobo/The-Documentation-Compendium.svg)](https://github.com/paulinaurbas/puppy.io/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/kylelobo/The-Documentation-Compendium.svg)](https://github.com/paulinaurbas/puppy.io/pulls)

</div>

---

<p align="center"> Application heliping with dog adpotion 
    <br> 
</p>

## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Deployment](#deployment)
- [Usage](#usage)
- [Built Using](#built_using)
- [Authors](#authors)

## 🧐 About <a name = "about"></a>

The purpose of the application was to create a tool to help adopt dogs. Users can add adoption offers, view them, and communicate with the person offering the offer (by sending email). Application supports two language: polish/english 

## 🏁 Getting Started <a name = "getting_started"></a>

### Mobile app
First run:
1. Install Flutter 2.5.3 (Dart 2.14.4) 
2. run `flutter pub get`
3. run `flutter run`

### Backend app 
#### Develop it locally

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

## 🎈 Usage <a name="usage"></a>

#### Registration & login 
1. Open app 
2. Register if you haven't had an account before or log in if you have already created an account. When registering, please provide your e-mail, username and password. 

#### Searching offer 
1. Log in to the application
2. Choose the filters you are interested in

#### Displaying offers
1. Log in to the application
2. Choose the filters you are interested in
3. Click search

#### Displaying offer details 
1. Log in to the application
2. Choose the filters you are interested in
3. Click search
4. Click on offer card 

#### Contact with user by email 
1. Log in to the application
2. Choose the filters you are interested in
3. Click search
4. Click on offer card 
5. Press contact with owner 

#### Add offer 

#### Edit offer  

#### Display user profile 

## 🚀 Deployment <a name = "deployment">Host it on Heroku</a>

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

## ⛏️ Built Using <a name = "built_using"></a>

- [DataBase] - Database //TODO 
- [Flask](https://flask.palletsprojects.com) - Server Framework
- [Flutter](https://flutter.dev) - Mobile Framework
- [Python](https://www.python.org) - Server Environment

## ✍️ Authors <a name = "authors"></a>

- [Michał Herjan](https://github.com/Argo123)
- [Franciszek Pogodziński](https://github.com/franpog859)
- [Paulina Urbaś](https://github.com/paulinaurbas)
