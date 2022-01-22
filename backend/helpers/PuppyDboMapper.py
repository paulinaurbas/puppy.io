from models.User import User
from models.Offer import Offer


def map_id(id_dbo) -> int:
    if len(id_dbo) == 0:
        return 0

    return id_dbo[0][0]


def map_login_data(login_data_dbo) -> User:
    if len(login_data_dbo) == 0:
        return User()

    user = User()
    login_data = login_data_dbo[0]
    user.username = login_data[0]
    user.email = login_data[1]

    return user


def map_offer(dog_offer_dbo, pictures_dbo, index_of_item=0) -> Offer:
    if len(dog_offer_dbo) == 0:
        return Offer()

    offer = Offer()
    dog_offer = dog_offer_dbo[index_of_item]
    offer.id = dog_offer[0]
    offer.name = dog_offer[1]
    offer.breed = dog_offer[2]
    offer.age = dog_offer[3]
    offer.sex = dog_offer[4]
    offer.description = dog_offer[5]
    offer.owner_email = dog_offer[6]
    offer.localization = [dog_offer[7], dog_offer[8]]
    offer.pictures = []

    for picture in pictures_dbo:
        if picture[1] == offer.id:
            offer.pictures.append(picture[0])

    return offer


def map_offers(dog_offers_dbo, pictures_dbo) -> []:
    if len(dog_offers_dbo) == 0:
        return []

    offers = []

    for i in range(len(dog_offers_dbo)):
        offers.append(map_offer(dog_offers_dbo, pictures_dbo, i))

    return offers
