from clients.PostgreSqlClient import PostgreSqlClient
from models import User, Dog, Offer
from repositories.queries import UserQueries, DogQueries
from helpers import PuppyDboMapper as pdm


class PuppiesRepository:
    db_client = PostgreSqlClient()

    def add_user(self, user: User):
        self.db_client.execute_with_parameters(UserQueries.INSERT_NEW_USER, {
            "Username": user.username,
            "Pass": user.password,
            "Email": user.email
        })

    def get_user_login_data(self, username: str, password: str) -> User:
        login_data_dbo = self.db_client.query_with_parameters(UserQueries.SELECT_USER_LOGIN_DATA_BY_USERNAME_AND_PASS, {
            "Username": username,
            "Pass": password
        })

        return pdm.map_login_data(login_data_dbo)

    def get_user_id(self, username: str) -> int:
        id_dbo = self.db_client.query_with_parameters(UserQueries.SELECT_USER_ID_BY_USERNAME, { "Username": username })
        return pdm.map_id(id_dbo)

    def add_dog(self, dog: Dog, username: str, pictures: [], localization: []):
        owner_id = self.get_user_id(username)
        self.db_client.execute_with_parameters(DogQueries.INSERT_NEW_DOG, {
            "Breed": dog.breed,
            "Name": dog.name,
            "Age": dog.age,
            "Sex": dog.sex,
            "Description": dog.description,
            "OwnerID": owner_id,
            "Latitude": localization[0],
            "Longitude": localization[1],
            "Pictures": pictures
        })

    def get_dog_offer(self, id: int) -> Offer:
        dog_offer_dbo = self.db_client.query_with_parameters(DogQueries.SELECT_DOG_BY_ID, {"ID": id})
        pictures_dbo = self.db_client.query_with_parameters(DogQueries.SELECT_DOG_PICTURES_BY_ID, {"ID": id})

        return pdm.map_offer(dog_offer_dbo, pictures_dbo)

    def get_dog_offers(self, owner_id: int) -> []:
        dog_offers_dbo = self.db_client.query_with_parameters(DogQueries.SELECT_DOGS_BY_OWNER_ID, {"OwnerID": owner_id})
        pictures_dbo = self.db_client.query_with_parameters(DogQueries.SELECT_DOG_PICTURES_BY_OWNER_ID, {"OwnerID": owner_id})

        return pdm.map_offers(dog_offers_dbo, pictures_dbo)

    def get_all_dog_offers(self) -> []:
        dog_offers_dbo = self.db_client.query(DogQueries.SELECT_ALL_DOGS)
        pictures_dbo = self.db_client.query(DogQueries.SELECT_ALL_DOGS_PICTURES)

        return pdm.map_offers(dog_offers_dbo, pictures_dbo)

    def update_dog(self, dog: Dog, username: str, pictures: [], localization: [], id: int):
        owner_id = self.get_user_id(username)
        self.db_client.execute_with_parameters(DogQueries.UPDATE_DOG, {
            "ID": id,
            "Breed": dog.breed,
            "Name": dog.name,
            "Age": dog.age,
            "Sex": dog.sex,
            "Description": dog.description,
            "OwnerID": owner_id,
            "Latitude": localization[0],
            "Longitude": localization[1],
            "Pictures": pictures
        })

    def delete_dog(self, id: int):
        self.db_client.execute_with_parameters(DogQueries.DELETE_DOG, {"ID": id})

