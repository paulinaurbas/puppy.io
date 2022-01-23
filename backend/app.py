import logging
from flask import Flask, jsonify, request
from flask_cors import CORS
from data_access.PuppiesDataAccess import PuppiesDataAccess

app = Flask(__name__)
cors = CORS(app)
puppies_data_access = PuppiesDataAccess()

if __name__ != '__main__':
    gunicorn_logger = logging.getLogger('gunicorn.error')
    app.logger.handlers = gunicorn_logger.handlers
    app.logger.setLevel(gunicorn_logger.level)

app.logger.info('Service setup finished successfully')


@app.route('/signIn', methods=['POST'])
def sign_in():
    app.logger.info('POST /signIn')
    data = request.get_json(force=True)
    if not data.get('username') or not data.get('password') or not data.get('email'):
        return jsonify(error='Failed to sign in, credentials are invalid'), 400

    if puppies_data_access.get_user_id(data) != 0:
        return jsonify(error='Failed to signed in, user already exists'), 403

    puppies_data_access.add_user(data)

    return {}, 201


@app.route('/logIn', methods=['POST'])
def log_in():
    app.logger.info('POST /logIn')
    data = request.get_json(force=True)
    if not data.get('username') or not data.get('password'):
        return jsonify(error='Failed to log in, incorrect login credentials'), 400

    login_data = puppies_data_access.get_user_login_data(data)
    if not login_data.username or login_data.username == '':
        return jsonify(error='Failed to log in, incorrect login credentials'), 400

    return jsonify(username=login_data.username, email=login_data.email), 200


@app.route('/dogOffer', methods=['POST'])
def dog_offer():
    app.logger.info('POST /dogOffer')
    data = request.get_json(force=True)
    if not data.get('name'):
        return jsonify(error='Dog offer is invalid'), 400

    puppies_data_access.add_dog(data, request.headers.get('username'))

    return {}, 201


@app.route('/dogOffer/<id>', methods=['GET', 'PUT', 'DELETE'])
def dog_offer_id(id):
    if request.method == 'GET':
        app.logger.info('GET /dogOffer/{}'.format(id))
        dog = puppies_data_access.get_dog_offer(int(id))

        return jsonify(dog.toJSON()), 200
    elif request.method == 'PUT':
        app.logger.info('PUT /dogOffer/{}'.format(id))
        data = request.get_json(force=True)
        if not data.get('name'):
            return jsonify(error='Dog offer is invalid'), 400

        puppies_data_access.update_dog(data, request.headers.get('username'), int(id))

        return {}, 204
    elif request.method == 'DELETE':
        app.logger.info('DELETE /dogOffer/{}'.format(id))
        puppies_data_access.delete_dog(int(id))
        return {}, 204


@app.route('/dogOffersByOwner/<username>', methods=['GET'])
def dog_offer_by_owner_id(username):
    app.logger.info('GET /dogOffersByOwner')
    user_id = puppies_data_access.get_user_id_by_str(username)

    if user_id == 0:
        return jsonify(error="User doesn't exist"), 400

    dogs = puppies_data_access.get_dog_offers(int(user_id))

    return jsonify(offers=[dog.toJSON() for dog in dogs]), 200


@app.route('/dogOffers', methods=['POST'])
def dog_offers():
    app.logger.info('GET /dogOffers')
    dogs = puppies_data_access.get_filtered_dog_offers(request.get_json(force=True))

    return jsonify(offers=[dog.toJSON() for dog in dogs]), 200


if __name__ == '__main__':
    app.run()
