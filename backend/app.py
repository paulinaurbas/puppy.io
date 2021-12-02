import logging
from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
cors = CORS(app)

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
    return {}, 201
    
@app.route('/logIn', methods=['POST'])
def log_in():
    app.logger.info('POST /logIn')
    data = request.get_json(force=True)
    if not data.get('username') or not data.get('password'):
        return jsonify(error='Failed to log in, incorrect login credentials'), 400
    return 200

@app.route('/dogOffer', methods=['POST'])
def dog_offer():
    app.logger.info('POST /dogOffer')
    data = request.get_json(force=True)
    if not data.get('name'):
        return jsonify(error='Dog offer is invalid'), 400
    return 201

@app.route('/dogOffer/<id>', methods=['GET', 'PUT', 'DELETE'])
def dog_offer_id(id):
    if request.method == 'GET':
        app.logger.info('GET /dogOffer/{}'.format(id))
        return jsonify(name='πez',
                       breed='burek',
                       age='9',
                       sex=1,
                       description='Super piez. Kocham go, ale oddaje do adopcji. Opiekuj sie nim',
                       pictures=['https://i.ibb.co/2Z93JrD/249481009-204616398465717-7236909556053593142-n.jpg', 'https://i.ibb.co/YQGCsK2/257916615-424243262753574-4370146952180881383-n.jpg'],
                       localization=[50.29262, 18,67061],
                       ownerEmail='oddajacy@buziaczek.pl'), 200
    elif request.method == 'PUT':
        app.logger.info('PUT /dogOffer/{}'.format(id))
        data = request.get_json(force=True)
        if not data.get('name'):
            return jsonify(error='Dog offer is invalid'), 400
        return 204
    elif request.method == 'DELETE':
        app.logger.info('DELETE /dogOffer/{}'.format(id))
        return 204

@app.route('/dogOffers', methods=['GET'])
def dog_offers():
    app.logger.info('GET /dogOffers')
    return jsonify(offers=[{'id':0,
                            'name':'πez',
                            'breed':'burek',
                            'age':'9',
                            'sex':1,
                            'pictures':['https://i.ibb.co/2Z93JrD/249481009-204616398465717-7236909556053593142-n.jpg', 'https://i.ibb.co/YQGCsK2/257916615-424243262753574-4370146952180881383-n.jpg']}, 
                           {'id':1,
                            'name':'πez2',
                            'breed':'burek',
                            'age':'9',
                            'sex':0,
                            'pictures':['https://i.ibb.co/2Z93JrD/249481009-204616398465717-7236909556053593142-n.jpg', 'https://i.ibb.co/YQGCsK2/257916615-424243262753574-4370146952180881383-n.jpg']}]), 200


if __name__ == '__main__':
    app.run()